provider "aws" {
  region = "eu-west-1"
}

##############################################################
# Data sources to get VPC, subnets and security group details
##############################################################
data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = "${data.aws_vpc.default.id}"
}

data "aws_security_group" "default" {
  vpc_id = "${data.aws_vpc.default.id}"
  name   = "default"
}

##################################################
# Create an IAM role to allow enhanced monitoring
##################################################
resource "aws_iam_role" "rds_enhanced_monitoring" {
  name               = "rds-enhanced_monitoring-role"
  assume_role_policy = "${data.aws_iam_policy_document.rds_enhanced_monitoring.json}"
}

resource "aws_iam_role_policy_attachment" "rds_enhanced_monitoring" {
  role       = "${aws_iam_role.rds_enhanced_monitoring.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}

data "aws_iam_policy_document" "rds_enhanced_monitoring" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["monitoring.rds.amazonaws.com"]
    }
  }
}

#####
# DB
#####
module "db" {
  source = "../../"

  identifier = "demodb"

  engine            = "mysql"
  engine_version    = "5.7.11"
  instance_class    = "db.t2.large"
  allocated_storage = 5
  storage_encrypted = false

  # kms_key_id        = "arm:aws:kms:<region>:<accound id>:key/<kms key id>"

  name                    = "demodb"
  username                = "user"
  password                = "YourPwdShouldBeLongAndSecure!"
  port                    = "3306"
  vpc_security_group_ids  = ["${data.aws_security_group.default.id}"]
  maintenance_window      = "Mon:00:00-Mon:03:00"
  backup_window           = "03:00-06:00"
  backup_retention_period = 0                                         // disable backups to create DB faster
  tags = {
    Owner       = "user"
    Environment = "dev"
  }
  # DB subnet group
  subnet_ids = ["${data.aws_subnet_ids.all.ids}"]
  # DB parameter group
  family = "mysql5.7"
  # DB option group
  major_engine_version = "5.7"
  monitoring_interval  = "30"
  monitoring_role_arn  = "${aws_iam_role.rds_enhanced_monitoring.arn}"
  # Database Deletion Protection
  deletion_protection = true
}

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

  name     = "demodb"
  username = "user"
  password = "YourPwdShouldBeLongAndSecure!"
  port     = "3306"

  vpc_security_group_ids = ["${data.aws_security_group.default.id}"]

  maintenance_window      = "Mon:00:00-Mon:03:00"
  backup_window           = "03:00-06:00"
  backup_retention_period = 0                     // disable backups to create DB faster

  # On replica option - Source DB for RDS replica
  replicate_source_db = "${var.replicate_source_db}"

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  # DB subnet group
  subnet_ids = ["${data.aws_subnet_ids.all.ids}"]

  # DB parameter group
  family = "mysql5.7"

  db_parameters_group = ["${var.db_parameters_group}"]
}

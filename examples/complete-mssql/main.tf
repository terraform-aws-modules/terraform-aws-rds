provider "aws" {
  region = "us-west-1"
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

  engine            = "sqlserver-se"
  engine_version    = "14.00.1000.169.v1"
  instance_class    = "db.t2.large"
  allocated_storage = 5
  storage_encrypted = false

  username = "demouser"

  password = "YourPwdShouldBeLongAndSecure!"
  port     = "1433"

  vpc_security_group_ids = ["${data.aws_security_group.default.id}"]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # disable backups to create DB faster
  backup_retention_period = 0

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  # DB subnet group
  subnet_ids = ["${data.aws_subnet_ids.all.ids}"]

  # Snapshot name upon DB deletion
  final_snapshot_identifier = "demodb"

  timezone = "Central Standard Time"
}

provider "aws" {
  region = "eu-west-1"
}

####################################
# Variables common to both instnaces
####################################
locals {
  engine            = "postgres"
  engine_version    = "9.6.9"
  instance_class    = "db.t2.large"
  allocated_storage = 5
  port              = "5432"
}

##############################################################
# Data sources to get VPC, subnets and security group details
##############################################################
data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

data "aws_security_group" "default" {
  vpc_id = data.aws_vpc.default.id
  name   = "default"
}

###########
# Master DB
###########
module "master" {
  source = "../../"

  identifier = "demodb-master-postgres"

  engine            = local.engine
  engine_version    = local.engine_version
  instance_class    = local.instance_class
  allocated_storage = local.allocated_storage

  name     = "demodbpostgres"
  username = "demouser"
  password = "YourPwdShouldBeLongAndSecure!"
  port     = local.port

  vpc_security_group_ids = [data.aws_security_group.default.id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Backups are required in order to create a replica
  backup_retention_period = 1

  # DB subnet group
  subnet_ids = data.aws_subnet_ids.all.ids

  create_db_option_group    = false
  create_db_parameter_group = false
}

############
# Replica DB
############
module "replica" {
  source = "../../"

  identifier = "demodb-replica-postgres"

  # Source database. For cross-region use this_db_instance_arn
  replicate_source_db = module.master.this_db_instance_id

  engine            = local.engine
  engine_version    = local.engine_version
  instance_class    = local.instance_class
  allocated_storage = local.allocated_storage

  # Username and password must not be set for replicas
  username = ""
  password = ""
  port     = local.port

  vpc_security_group_ids = [data.aws_security_group.default.id]

  maintenance_window = "Tue:00:00-Tue:03:00"
  backup_window      = "03:00-06:00"

  # disable backups to create DB faster
  backup_retention_period = 0

  # Not allowed to specify a subnet group for replicas in the same region
  create_db_subnet_group = false

  create_db_option_group    = false
  create_db_parameter_group = false
}

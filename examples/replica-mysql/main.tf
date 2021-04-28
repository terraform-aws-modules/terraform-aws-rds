provider "aws" {
  region = local.region
}

locals {
  name   = "replica-mysql"
  region = "eu-west-1"
  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  engine                = "mysql"
  engine_version        = "8.0.20"
  family                = "mysql8.0" # DB parameter group
  major_engine_version  = "8.0"      # DB option group
  instance_class        = "db.t3.large"
  allocated_storage     = 20
  max_allocated_storage = 100
  port                  = 3306
}


################################################################################
# Supporting Resources
################################################################################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 2.0"

  name = local.name
  cidr = "10.99.0.0/18"

  azs              = ["${local.region}a", "${local.region}b", "${local.region}c"]
  public_subnets   = ["10.99.0.0/24", "10.99.1.0/24", "10.99.2.0/24"]
  private_subnets  = ["10.99.3.0/24", "10.99.4.0/24", "10.99.5.0/24"]
  database_subnets = ["10.99.7.0/24", "10.99.8.0/24", "10.99.9.0/24"]

  create_database_subnet_group = true

  tags = local.tags
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4"

  name        = local.name
  description = "Replica MySQL example security group"
  vpc_id      = module.vpc.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      description = "MySQL access from within VPC"
      cidr_blocks = module.vpc.vpc_cidr_block
    },
  ]

  tags = local.tags
}

################################################################################
# Master DB
################################################################################

module "master" {
  source = "../../"

  identifier = "${local.name}-master"

  engine               = local.engine
  engine_version       = local.engine_version
  family               = local.family
  major_engine_version = local.major_engine_version
  instance_class       = local.instance_class

  allocated_storage     = local.allocated_storage
  max_allocated_storage = local.max_allocated_storage
  storage_encrypted     = false

  name     = "replicaMysql"
  username = "replica_mysql"
  password = "YourPwdShouldBeLongAndSecure!"
  port     = local.port

  multi_az               = true
  create_db_subnet_group = false
  db_subnet_group_name   = module.vpc.database_subnet_group_name
  vpc_security_group_ids = [module.security_group.security_group_id]

  maintenance_window              = "Mon:00:00-Mon:03:00"
  backup_window                   = "03:00-06:00"
  enabled_cloudwatch_logs_exports = ["general"]

  # Backups are required in order to create a replica
  backup_retention_period = 1
  skip_final_snapshot     = true
  deletion_protection     = false

  tags = local.tags
}

################################################################################
# Replica DB
################################################################################

module "replica" {
  source = "../../"

  identifier = "${local.name}-replica"

  # Source database. For cross-region use db_instance_arn
  replicate_source_db = module.master.db_instance_id

  engine               = local.engine
  engine_version       = local.engine_version
  family               = local.family
  major_engine_version = local.major_engine_version
  instance_class       = local.instance_class

  allocated_storage     = local.allocated_storage
  max_allocated_storage = local.max_allocated_storage
  storage_encrypted     = false

  # Username and password should not be set for replicas
  username = null
  password = null
  port     = local.port

  multi_az               = false
  vpc_security_group_ids = [module.security_group.security_group_id]

  maintenance_window              = "Tue:00:00-Tue:03:00"
  backup_window                   = "03:00-06:00"
  enabled_cloudwatch_logs_exports = ["general"]

  backup_retention_period = 0
  skip_final_snapshot     = true
  deletion_protection     = false

  # Not allowed to specify a subnet group for replicas in the same region
  create_db_subnet_group = false

  tags = local.tags
}

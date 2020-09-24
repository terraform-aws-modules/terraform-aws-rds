provider "aws" {
  region = var.aws_region
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

data "http" "my_public_ip" {
  url = "https://ipecho.net/plain"
}

#################################
# Security Group for PostGres   #
#################################
module "postgresql_security_group" {
  source              = "terraform-aws-modules/security-group/aws//modules/postgresql"
  version             = "~> 3.16"
  name                = "mysql-sg-terraform-teste"
  ingress_cidr_blocks = ["${chomp(data.http.my_public_ip.body)}/32"]
  vpc_id              = data.aws_vpc.default.id
}

#####
# DB
#####
module "db" {
  source = "../../"

  identifier = var.name

  engine              = var.engine_name
  engine_version      = var.engine_version
  instance_class      = "db.t2.large"
  allocated_storage   = 5
  storage_encrypted   = false
  publicly_accessible = var.publicly_accessible

  # kms_key_id        = "arm:aws:kms:<region>:<account id>:key/<kms key id>"
  name = var.database_name

  # NOTE: Do NOT use 'user' as the value for 'username' as it throws:
  # "Error creating DB Instance: InvalidParameterValue: MasterUsername
  # user cannot be used as it is a reserved word used by the engine"
  username = var.username

  password = var.password
  port     = var.port

  vpc_security_group_ids = [module.postgresql_security_group.this_security_group_id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # disable backups to create DB faster
  backup_retention_period = 0

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]

  # DB subnet group
  subnet_ids = data.aws_subnet_ids.all.ids

  # DB parameter group
  family = "postgres9.6"

  # DB option group
  major_engine_version = var.major_engine_version

  # Snapshot name upon DB deletion
  final_snapshot_identifier = "demodb"

  # Database Deletion Protection
  deletion_protection = false
}

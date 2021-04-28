provider "aws" {
  region = local.region
}

locals {
  name   = "enhanced-monitoring"
  region = "eu-west-1"
  tags = {
    Owner       = "user"
    Environment = "dev"
  }
}

################################################################################
# Supporting Resources
################################################################################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 2"

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
  description = "Enhanced monitoring MySQL example security group"
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
# Create an IAM role to allow enhanced monitoring
################################################################################

resource "aws_iam_role" "rds_enhanced_monitoring" {
  name_prefix        = "rds-enhanced-monitoring-"
  assume_role_policy = data.aws_iam_policy_document.rds_enhanced_monitoring.json
}

resource "aws_iam_role_policy_attachment" "rds_enhanced_monitoring" {
  role       = aws_iam_role.rds_enhanced_monitoring.name
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

################################################################################
# RDS Module
################################################################################

module "db" {
  source = "../../"

  identifier = local.name

  # All available versions: http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html#MySQL.Concepts.VersionMgmt
  engine               = "mysql"
  engine_version       = "8.0.20"
  family               = "mysql8.0" # DB parameter group
  major_engine_version = "8.0"      # DB option group
  instance_class       = "db.t3.large"

  allocated_storage     = 20
  max_allocated_storage = 100
  storage_encrypted     = false

  name     = "completeMysql"
  username = "complete_mysql"
  password = "YourPwdShouldBeLongAndSecure!"
  port     = 3306

  multi_az               = true
  subnet_ids             = module.vpc.database_subnets
  vpc_security_group_ids = [module.security_group.security_group_id]

  maintenance_window              = "Mon:00:00-Mon:03:00"
  backup_window                   = "03:00-06:00"
  enabled_cloudwatch_logs_exports = ["audit", "general"]

  backup_retention_period = 0
  skip_final_snapshot     = true
  deletion_protection     = false

  # Enhanced monitoring
  monitoring_interval = 30
  monitoring_role_arn = aws_iam_role.rds_enhanced_monitoring.arn

  performance_insights_enabled          = true
  performance_insights_retention_period = 7
  create_monitoring_role                = true

  tags = local.tags
}

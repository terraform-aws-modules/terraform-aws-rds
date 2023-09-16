provider "aws" {
  region = local.region
}

data "aws_caller_identity" "current" {}
data "aws_availability_zones" "available" {}

locals {
  name   = "role-association-invoke-lambda"
  region = "eu-west-1"

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Name       = local.name
    Example    = local.name
    Repository = "https://github.com/terraform-aws-modules/terraform-aws-rds"
  }
}

################################################################################
# RDS Module
################################################################################

module "db" {
  source = "../../"

  identifier = local.name

  # All available versions: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#PostgreSQL.Concepts
  engine               = "postgres"
  engine_version       = "14"
  family               = "postgres14" # DB parameter group
  major_engine_version = "14"         # DB option group
  instance_class       = "db.t4g.large"

  allocated_storage = 20

  # NOTE: Do NOT use 'user' as the value for 'username' as it throws:
  # "Error creating DB Instance: InvalidParameterValue: MasterUsername
  # user cannot be used as it is a reserved word used by the engine"
  db_name  = "RoleAssociationInvokeLambda"
  username = "role_association_invoke_lambda"
  port     = 5432

  multi_az               = true
  db_subnet_group_name   = module.vpc.database_subnet_group
  vpc_security_group_ids = [module.security_group.security_group_id]

  maintenance_window      = "Mon:00:00-Mon:03:00"
  backup_window           = "03:00-06:00"
  backup_retention_period = 0

  deletion_protection = false

  # https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/PostgreSQL-Lambda.html
  db_instance_role_associations = {
    Lambda = module.rds_invoke_lambda_role.iam_role_arn
  }

  parameters = [
    {
      name         = "rds.custom_dns_resolution"
      value        = 1
      apply_method = "pending-reboot"
    },
  ]

  tags = local.tags
}

################################################################################
# Supporting Resources
################################################################################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = local.name
  cidr = local.vpc_cidr

  azs              = local.azs
  public_subnets   = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k)]
  private_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 3)]
  database_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 6)]

  create_database_subnet_group = true
  enable_nat_gateway           = true

  tags = local.tags
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = local.name
  description = "Complete PostgreSQL example security group"
  vpc_id      = module.vpc.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      description = "PostgreSQL access from within VPC"
      cidr_blocks = module.vpc.vpc_cidr_block
    },
  ]

  # egress
  egress_with_cidr_blocks = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "Egress to AWS Lambda VPC"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  tags = local.tags
}

module "rds_invoke_lambda_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 5.28.0"

  create_role       = true
  role_requires_mfa = false

  role_name_prefix = local.name

  custom_role_policy_arns = [
    module.rds_invoke_lambda_policy.arn
  ]
  custom_role_trust_policy = data.aws_iam_policy_document.rds_invoke_lambda_assume_role.json
}

module "rds_invoke_lambda_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "~> 5.28.0"

  name        = "${local.name}-policy"
  path        = "/"
  description = "Invoke Lambda from RDS Postgresql policy"

  policy = data.aws_iam_policy_document.rds_invoke_lambda.json
}

data "aws_iam_policy_document" "rds_invoke_lambda" {
  statement {
    sid = "InvokeLambda"
    actions = [
      "lambda:InvokeFunction"
    ]
    resources = [
      module.lambda.lambda_function_arn
    ]
  }
}

data "aws_iam_policy_document" "rds_invoke_lambda_assume_role" {
  statement {
    sid = "AssumeRole"

    principals {
      type        = "Service"
      identifiers = ["rds.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      values   = [data.aws_caller_identity.current.id]
      variable = "aws:SourceAccount"
    }

    effect = "Allow"

    actions = ["sts:AssumeRole"]
  }
}

module "lambda" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "~> 6.0"

  function_name = local.name
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.10"
  source_path   = "${path.module}/fixtures/lambda_function.py"
}

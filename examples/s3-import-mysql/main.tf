provider "aws" {
  region = local.region
}

locals {
  name   = "s3_import"
  region = "eu-west-1"
  tags = {
    Owner       = "user"
    Environment = "dev"
  }
}
################################################################################
# Supporting Resources
################################################################################

resource "random_pet" "this" {
  length = 2
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.70.0"

  name = local.name
  cidr = "10.0.0.0/18"

  azs              = ["${local.region}a", "${local.region}b", "${local.region}c"]
  public_subnets   = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  private_subnets  = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
  database_subnets = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"]

  create_database_subnet_group = true
  enable_nat_gateway           = true
  single_nat_gateway           = true

  tags = local.tags
}

module "import_s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "1.17.0"

  bucket        = "${local.name}-${random_pet.this.id}"
  acl           = "private"
  force_destroy = true

  tags = local.tags
}

data "aws_iam_policy_document" "s3_import_assume" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["rds.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "s3_import" {
  name                  = "${local.name}-${random_pet.this.id}"
  description           = "IAM role to allow RDS to import MySQL backup from S3"
  assume_role_policy    = data.aws_iam_policy_document.s3_import_assume.json
  force_detach_policies = true

  tags = local.tags
}

data "aws_iam_policy_document" "s3_import" {
  statement {
    actions = [
      "s3:ListBucket",
      "s3:GetBucketLocation",
    ]

    resources = [
      module.import_s3_bucket.this_s3_bucket_arn
    ]
  }

  statement {
    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${module.import_s3_bucket.this_s3_bucket_arn}/*",
    ]
  }
}

resource "aws_iam_role_policy" "s3_import" {
  name   = "${local.name}-${random_pet.this.id}"
  role   = aws_iam_role.s3_import.id
  policy = data.aws_iam_policy_document.s3_import.json
}


################################################################################
# RDS Module
################################################################################

module "db" {
  source = "../../"

  identifier = local.name

  engine               = "mysql"
  engine_version       = "5.7.31"
  family               = "mysql5.7"
  major_engine_version = "5.7"
  instance_class       = "db.t2.large"
  allocated_storage    = 20
  storage_encrypted    = false

  name     = local.name
  username = "user"
  password = "YourPwdShouldBeLongAndSecure!"
  port     = "3306"

  # S3 import https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MySQL.Procedural.Importing.html
  s3_import = {
    source_engine_version = "5.7.31"
    bucket_name           = module.import_s3_bucket.this_s3_bucket_id
    ingestion_role        = aws_iam_role.s3_import.arn
  }


  multi_az               = true
  subnet_ids             = data.aws_subnet_ids.all.ids
  vpc_security_group_ids = [data.aws_security_group.default.id]

  maintenance_window              = "Mon:00:00-Mon:03:00"
  backup_window                   = "03:00-06:00"
  enabled_cloudwatch_logs_exports = ["audit", "general"]

  backup_retention_period   = 0
  final_snapshot_identifier = local.name
  deletion_protection       = false

  tags = {
    Owner       = "user"
    Environment = "dev"
  }
}

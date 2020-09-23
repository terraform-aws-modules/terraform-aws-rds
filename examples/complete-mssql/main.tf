provider "aws" {
  region = "us-east-1"
}

locals {
  tags = {
    Owner       = "user"
    Environment = "dev"
  }
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

#####################################
# IAM Role for Windows Authentication
#####################################

data "aws_iam_policy_document" "rds_assume_role" {
  statement {
    sid = "AssumeRole"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["rds.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "rds_ad_auth" {
  name                  = "demo-rds-ad-auth"
  description           = "Role used by RDS for Active Directory authentication and authorization"
  force_detach_policies = true
  assume_role_policy    = data.aws_iam_policy_document.rds_assume_role.json

  tags = local.tags
}

resource "aws_iam_role_policy_attachment" "rds_directory_services" {
  role       = aws_iam_role.rds_ad_auth.id
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSDirectoryServiceAccess"
}

##########################################
# AWS Directory Service (Acitve Directory)
##########################################

resource "aws_directory_service_directory" "demo" {
  name     = "corp.demo.com"
  password = "SuperSecretPassw0rd"
  edition  = "Standard"
  type     = "MicrosoftAD"

  vpc_settings {
    vpc_id = data.aws_vpc.default.id
    # Only 2 subnets, must be in different AZs
    subnet_ids = slice(tolist(data.aws_subnet_ids.all.ids), 0, 2)
  }

  tags = local.tags
}

#####
# DB
#####

module "db" {
  source = "../../"

  identifier = "demodb"

  engine            = "sqlserver-ex"
  engine_version    = "14.00.1000.169.v1"
  instance_class    = "db.t2.medium"
  allocated_storage = 20
  storage_encrypted = false

  name     = null # "demodb"
  username = "demouser"
  password = "YourPwdShouldBeLongAndSecure!"
  port     = "1433"

  domain               = aws_directory_service_directory.demo.id
  domain_iam_role_name = aws_iam_role.rds_ad_auth.name

  vpc_security_group_ids = [data.aws_security_group.default.id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # disable backups to create DB faster
  backup_retention_period = 0

  tags = local.tags

  # DB subnet group
  subnet_ids = data.aws_subnet_ids.all.ids

  # Snapshot name upon DB deletion
  final_snapshot_identifier = "demodb"

  create_db_parameter_group = false
  license_model             = "license-included"

  timezone = "Central Standard Time"

  # Database Deletion Protection
  deletion_protection = false

  # DB options
  major_engine_version = "14.00"

  options = []
}

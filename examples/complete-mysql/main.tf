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

##############################
# Security Group for Mysql   #
##############################
module "mysql_security_group" {
  source              = "terraform-aws-modules/security-group/aws//modules/mysql"
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

  # All available versions: http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html#MySQL.Concepts.VersionMgmt
  engine              = var.engine_name
  engine_version      = var.engine_version
  instance_class      = "db.t2.large"
  allocated_storage   = 5
  storage_encrypted   = false
  publicly_accessible = var.publicly_accessible

  # kms_key_id        = "arm:aws:kms:<region>:<accound id>:key/<kms key id>"
  name     = var.database_name
  username = var.username
  password = var.password
  port     = "3306"

  vpc_security_group_ids = [module.mysql_security_group.this_security_group_id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  multi_az = true

  # disable backups to create DB faster
  backup_retention_period = 0

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  enabled_cloudwatch_logs_exports = ["audit", "general"]

  # DB subnet group
  subnet_ids = data.aws_subnet_ids.all.ids

  # DB parameter group
  family = "mysql5.7"

  # DB option group
  major_engine_version = var.major_engine_version

  # Snapshot name upon DB deletion
  final_snapshot_identifier = var.database_name

  # Database Deletion Protection
  deletion_protection = false

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8"
    },
    {
      name  = "character_set_server"
      value = "utf8"
    }
  ]

  options = [
    {
      option_name = "MARIADB_AUDIT_PLUGIN"

      option_settings = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "CONNECT"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "37"
        },
      ]
    },
  ]
}

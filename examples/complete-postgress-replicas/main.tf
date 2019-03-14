provider "aws" {
  region = "eu-west-1"
}

provider "aws" {
    alias  = "crossregion"
    region = "eu-west-2"
}

#################################################################################################
# Data sources to get VPC, subnets and security group details for source region and backup region
#################################################################################################
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

data "aws_vpc" "default-crossregion" {
  provider = "aws.crossregion"
  default = true
}

data "aws_subnet_ids" "all-crossregion" {
  provider = "aws.crossregion"
  vpc_id = "${data.aws_vpc.default-crossregion.id}"
}

data "aws_security_group" "default-crossregion" {
  provider = "aws.crossregion"
  vpc_id = "${data.aws_vpc.default-crossregion.id}"
  name   = "default"
}

#####
# DB
#####
module "db" {
  source = "../../"

  identifier = "demodb"

  engine            = "postgres"
  engine_version    = "10.5"
  instance_class    = "db.t2.large"
  allocated_storage = 5
  storage_encrypted = false

  # kms_key_id        = "arm:aws:kms:<region>:<account id>:key/<kms key id>"
  name = "demodb"

  # NOTE: Do NOT use 'user' as the value for 'username' as it throws:
  # "Error creating DB Instance: InvalidParameterValue: MasterUsername
  # user cannot be used as it is a reserved word used by the engine"
  username = "demouser"

  password = "YourPwdShouldBeLongAndSecure!"
  port     = "5432"

  vpc_security_group_ids = ["${data.aws_security_group.default.id}"]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # disable backups to create DB faster
  backup_retention_period = 1

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  # DB subnet group
  subnet_ids = ["${data.aws_subnet_ids.all.ids}"]

  # DB parameter group
  family = "postgres10"

  # DB option group
  major_engine_version = ""

  # Snapshot name upon DB deletion
  final_snapshot_identifier = "demodb"

  # Database Deletion Protection
  deletion_protection = false
}

############
# DB REPLICA
############
module "db-crossregion-replica" {
  source = "../../"

  providers = {
    aws = "aws.crossregion"
  }

  is_replica = "true"
  replicate_source_db = "${module.db.this_db_instance_arn}"

  identifier = "demodb"

  engine            = "postgres"
  engine_version    = "10.5"
  instance_class    = "db.t2.large"
  allocated_storage = 5
  storage_encrypted = false

  # disable backups to create DB faster
  backup_retention_period = 0

  # kms_key_id        = "arm:aws:kms:<region>:<account id>:key/<kms key id>"
  name = "demodb"

  # User and password are ignored on DB replica creation
  username = ""
  password = ""
  port     = "5432"

  vpc_security_group_ids = ["${data.aws_security_group.default-crossregion.id}"]

  # Replicas do not usually require backup. Some RDS types do not allow backups for RDS replicas
  maintenance_window = ""
  backup_window      = ""

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  # DB subnet group
  subnet_ids = ["${data.aws_subnet_ids.all-crossregion.ids}"]

  # DB parameter group
  family = "postgres10"

  # DB option group
  major_engine_version = ""

}

############
# DB REPLICA
############
module "db-replica" {
  source = "../../"

  is_replica = "true"
  replicate_source_db = "${module.db.this_db_instance_name}"

  identifier = "demodb-replica"

  engine            = "postgres"
  engine_version    = "10.5"
  instance_class    = "db.t2.large"
  allocated_storage = 5
  storage_encrypted = false

  # disable backups to create DB faster
  backup_retention_period = 0

  # kms_key_id        = "arm:aws:kms:<region>:<account id>:key/<kms key id>"
  name = "demodb"

  # User and password are ignored on DB replica creation
  username = ""
  password = ""
  port     = "5432"

  vpc_security_group_ids = ["${data.aws_security_group.default.id}"]

  # Replicas do not usually require backup. Some RDS types do not allow backups for RDS replicas
  maintenance_window = ""
  backup_window      = ""

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  # DB subnet group
  subnet_ids = ["${data.aws_subnet_ids.all.ids}"]

  # DB parameter group
  family = "postgres10"

  # DB option group
  major_engine_version = ""

}

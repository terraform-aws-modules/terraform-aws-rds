provider "aws" {
  region = local.region
}

locals {
  name   = "option-groups"
  region = "eu-west-1"
  tags = {
    Owner       = "user"
    Environment = "dev"
  }
}

################################################################################
# Default Postgres
################################################################################

module "default_postgres" {
  source = "../../"

  identifier = local.name

  # This should NOT create an option group since they are not supported for PostgreSQL
  # https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithOptionGroups.html

  parameter_group_name = "${local.name}-default-postgresql"

  db_subnet_group_name   = "foo"
  create_db_subnet_group = false

  # All available versions: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#PostgreSQL.Concepts
  create_db_instance   = false
  engine               = "postgres"
  engine_version       = "11.10"
  family               = "postgres11" # DB parameter group
  major_engine_version = "11"         # DB option group
  instance_class       = "db.t3.large"

  allocated_storage = 20

  username = "option_groups_postgresql"
  password = "YourPwdShouldBeLongAndSecure!"
  port     = 5432

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  tags = local.tags
}

################################################################################
# Default MySQL
################################################################################

module "default_mysql" {
  source = "../../"

  identifier = local.name

  option_group_name = "${local.name}-default-mysql"

  parameter_group_name = "${local.name}-default-mysql"

  db_subnet_group_name   = "foo"
  create_db_subnet_group = false

  # All available versions: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#PostgreSQL.Concepts
  create_db_instance   = false
  engine               = "mysql"
  engine_version       = "8.0.20"
  family               = "mysql8.0" # DB parameter group
  major_engine_version = "8.0"      # DB option group
  instance_class       = "db.t3.large"

  allocated_storage = 20

  username = "option_groups_mysql"
  password = "YourPwdShouldBeLongAndSecure!"
  port     = 3306

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  tags = local.tags
}

################################################################################
# Default MySQL w/o name prefix
################################################################################

module "default_mysql_name" {
  source = "../../"

  identifier = local.name

  option_group_name            = "${local.name}-default-mysql-name"
  option_group_use_name_prefix = false

  parameter_group_name            = "${local.name}-default-mysql-name"
  parameter_group_use_name_prefix = false

  db_subnet_group_name   = "foo"
  create_db_subnet_group = false

  # All available versions: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#PostgreSQL.Concepts
  create_db_instance   = false
  engine               = "mysql"
  engine_version       = "8.0.20"
  family               = "mysql8.0" # DB parameter group
  major_engine_version = "8.0"      # DB option group
  instance_class       = "db.t3.large"

  allocated_storage = 20

  username = "option_groups_mysql"
  password = "YourPwdShouldBeLongAndSecure!"
  port     = 3306

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  tags = local.tags
}

################################################################################
# Default MySQL using AWS provided default groups
################################################################################

module "default_mysql_default_aws" {
  source = "../../"

  identifier = local.name

  create_db_option_group    = false
  create_db_parameter_group = false

  db_subnet_group_name   = "foo"
  create_db_subnet_group = false

  # All available versions: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#PostgreSQL.Concepts
  create_db_instance   = false
  engine               = "mysql"
  engine_version       = "8.0.20"
  family               = "mysql8.0" # DB parameter group
  major_engine_version = "8.0"      # DB option group
  instance_class       = "db.t3.large"

  allocated_storage = 20

  username = "option_groups_mysql"
  password = "YourPwdShouldBeLongAndSecure!"
  port     = 3306

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  tags = local.tags
}

################################################################################
# BYO MySQL
################################################################################

module "byo_mysql" {
  source = "../../"

  identifier = local.name

  create_db_option_group = false
  option_group_name      = "bringMyOwnOptionGroupName"

  create_db_parameter_group = false
  parameter_group_name      = "bringMyOwnParameterGroupName"

  db_subnet_group_name   = "foo"
  create_db_subnet_group = false

  # All available versions: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#PostgreSQL.Concepts
  create_db_instance   = false
  engine               = "mysql"
  engine_version       = "8.0.20"
  family               = "mysql8.0" # DB parameter group
  major_engine_version = "8.0"      # DB option group
  instance_class       = "db.t3.large"

  allocated_storage = 20

  username = "option_groups_mysql"
  password = "YourPwdShouldBeLongAndSecure!"
  port     = 3306

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  tags = local.tags
}

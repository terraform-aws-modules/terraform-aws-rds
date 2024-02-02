locals {
  create_db_subnet_group    = var.create_db_subnet_group && var.putin_khuylo
  create_db_parameter_group = var.create_db_parameter_group && var.putin_khuylo
  create_db_instance        = var.create_db_instance && var.putin_khuylo

  db_subnet_group_name    = var.create_db_subnet_group ? module.db_subnet_group.db_subnet_group_id : var.db_subnet_group_name
  parameter_group_name_id = var.create_db_parameter_group ? module.db_parameter_group.db_parameter_group_id : var.parameter_group_name

  create_db_option_group = var.create_db_option_group && var.engine != "postgres"
  option_group           = local.create_db_option_group ? module.db_option_group.db_option_group_id : var.option_group_name
}

module "db_subnet_group" {
  source = "./modules/db_subnet_group"

  create = local.create_db_subnet_group

  name            = coalesce(var.db_subnet_group_name, var.identifier)
  use_name_prefix = var.db_subnet_group_use_name_prefix
  description     = var.db_subnet_group_description
  subnet_ids      = var.subnet_ids

  tags = merge(var.tags, var.db_subnet_group_tags)
}

module "db_parameter_group" {
  source = "./modules/db_parameter_group"

  create = local.create_db_parameter_group

  name            = coalesce(var.parameter_group_name, var.identifier)
  use_name_prefix = var.parameter_group_use_name_prefix
  description     = var.parameter_group_description
  family          = var.family

  parameters = var.parameters

  tags = merge(var.tags, var.db_parameter_group_tags)
}

module "db_option_group" {
  source = "./modules/db_option_group"

  create = local.create_db_option_group

  name                     = coalesce(var.option_group_name, var.identifier)
  use_name_prefix          = var.option_group_use_name_prefix
  option_group_description = var.option_group_description
  engine_name              = var.engine
  major_engine_version     = var.major_engine_version

  options = var.options

  timeouts = var.option_group_timeouts

  tags = merge(var.tags, var.db_option_group_tags)
}

module "db_instance" {
  source = "./modules/db_instance"

  create                = local.create_db_instance
  identifier            = var.identifier
  use_identifier_prefix = var.instance_use_identifier_prefix

  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type
  storage_encrypted = var.storage_encrypted
  kms_key_id        = var.kms_key_id
  license_model     = var.license_model

  db_name                             = var.db_name
  username                            = var.username
  password                            = var.manage_master_user_password ? null : var.password
  port                                = var.port
  domain                              = var.domain
  domain_iam_role_name                = var.domain_iam_role_name
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  custom_iam_instance_profile         = var.custom_iam_instance_profile
  manage_master_user_password         = var.manage_master_user_password
  master_user_secret_kms_key_id       = var.master_user_secret_kms_key_id

  manage_master_user_password_rotation                   = var.manage_master_user_password_rotation
  master_user_password_rotate_immediately                = var.master_user_password_rotate_immediately
  master_user_password_rotation_automatically_after_days = var.master_user_password_rotation_automatically_after_days
  master_user_password_rotation_duration                 = var.master_user_password_rotation_duration
  master_user_password_rotation_schedule_expression      = var.master_user_password_rotation_schedule_expression

  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name   = local.db_subnet_group_name
  parameter_group_name   = local.parameter_group_name_id
  option_group_name      = var.engine != "postgres" ? local.option_group : null
  network_type           = var.network_type

  availability_zone   = var.availability_zone
  multi_az            = var.multi_az
  iops                = var.iops
  storage_throughput  = var.storage_throughput
  publicly_accessible = var.publicly_accessible
  ca_cert_identifier  = var.ca_cert_identifier

  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  apply_immediately           = var.apply_immediately
  maintenance_window          = var.maintenance_window
  blue_green_update           = var.blue_green_update

  snapshot_identifier              = var.snapshot_identifier
  copy_tags_to_snapshot            = var.copy_tags_to_snapshot
  skip_final_snapshot              = var.skip_final_snapshot
  final_snapshot_identifier_prefix = var.final_snapshot_identifier_prefix

  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_retention_period = var.performance_insights_retention_period
  performance_insights_kms_key_id       = var.performance_insights_enabled ? var.performance_insights_kms_key_id : null

  replicate_source_db                  = var.replicate_source_db
  replica_mode                         = var.replica_mode
  backup_retention_period              = var.backup_retention_period
  backup_window                        = var.backup_window
  max_allocated_storage                = var.max_allocated_storage
  monitoring_interval                  = var.monitoring_interval
  monitoring_role_arn                  = var.monitoring_role_arn
  monitoring_role_name                 = var.monitoring_role_name
  monitoring_role_use_name_prefix      = var.monitoring_role_use_name_prefix
  monitoring_role_description          = var.monitoring_role_description
  create_monitoring_role               = var.create_monitoring_role
  monitoring_role_permissions_boundary = var.monitoring_role_permissions_boundary

  character_set_name       = var.character_set_name
  nchar_character_set_name = var.nchar_character_set_name
  timezone                 = var.timezone

  enabled_cloudwatch_logs_exports        = var.enabled_cloudwatch_logs_exports
  create_cloudwatch_log_group            = var.create_cloudwatch_log_group
  cloudwatch_log_group_retention_in_days = var.cloudwatch_log_group_retention_in_days
  cloudwatch_log_group_kms_key_id        = var.cloudwatch_log_group_kms_key_id

  timeouts = var.timeouts

  deletion_protection      = var.deletion_protection
  delete_automated_backups = var.delete_automated_backups

  restore_to_point_in_time = var.restore_to_point_in_time
  s3_import                = var.s3_import

  tags = merge(var.tags, var.db_instance_tags)
}

module "db_instance_role_association" {
  source = "./modules/db_instance_role_association"

  for_each = { for k, v in var.db_instance_role_associations : k => v if var.create_db_instance }

  feature_name           = each.key
  role_arn               = each.value
  db_instance_identifier = module.db_instance.db_instance_identifier
}

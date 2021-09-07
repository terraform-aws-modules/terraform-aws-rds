locals {
  is_mssql = element(split("-", var.engine), 0) == "sqlserver"

  monitoring_role_arn = var.create_monitoring_role ? aws_iam_role.enhanced_monitoring[0].arn : var.monitoring_role_arn
}

# Ref. https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces
data "aws_partition" "current" {}

resource "random_id" "snapshot_identifier" {
  count = var.create && !var.skip_final_snapshot ? 1 : 0

  keepers = {
    id = var.identifier
  }

  byte_length = 4
}

resource "aws_db_instance" "this" {
  count = var.create && false == local.is_mssql ? 1 : 0

  identifier = var.identifier

  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type
  storage_encrypted = var.storage_encrypted
  kms_key_id        = var.kms_key_id
  license_model     = var.license_model

  name                                = var.name
  username                            = var.username
  password                            = var.password
  port                                = var.port
  domain                              = var.domain
  domain_iam_role_name                = var.domain_iam_role_name
  iam_database_authentication_enabled = var.iam_database_authentication_enabled

  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name   = var.db_subnet_group_name
  parameter_group_name   = var.parameter_group_name
  option_group_name      = var.option_group_name

  availability_zone   = var.availability_zone
  multi_az            = var.multi_az
  iops                = var.iops
  publicly_accessible = var.publicly_accessible
  ca_cert_identifier  = var.ca_cert_identifier

  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  apply_immediately           = var.apply_immediately
  maintenance_window          = var.maintenance_window

  snapshot_identifier   = var.snapshot_identifier
  copy_tags_to_snapshot = var.copy_tags_to_snapshot
  skip_final_snapshot   = var.skip_final_snapshot
  # TODO - remove coalesce() at next breaking change - adding existing name as fallback to maintain backwards compatibility
  final_snapshot_identifier = var.skip_final_snapshot ? null : coalesce(var.final_snapshot_identifier, "${var.final_snapshot_identifier_prefix}-${var.identifier}-${random_id.snapshot_identifier[0].hex}")

  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_retention_period = var.performance_insights_enabled ? var.performance_insights_retention_period : null
  performance_insights_kms_key_id       = var.performance_insights_enabled ? var.performance_insights_kms_key_id : null

  replicate_source_db     = var.replicate_source_db
  backup_retention_period = var.backup_retention_period
  backup_window           = var.backup_window
  max_allocated_storage   = var.max_allocated_storage
  monitoring_interval     = var.monitoring_interval
  monitoring_role_arn     = var.monitoring_interval > 0 ? local.monitoring_role_arn : null

  character_set_name              = var.character_set_name
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  deletion_protection      = var.deletion_protection
  delete_automated_backups = var.delete_automated_backups


  dynamic "restore_to_point_in_time" {
    for_each = var.restore_to_point_in_time != null ? [var.restore_to_point_in_time] : []

    content {
      restore_time                  = lookup(restore_to_point_in_time.value, "restore_time", null)
      source_db_instance_identifier = lookup(restore_to_point_in_time.value, "source_db_instance_identifier", null)
      source_dbi_resource_id        = lookup(restore_to_point_in_time.value, "source_dbi_resource_id", null)
      use_latest_restorable_time    = lookup(restore_to_point_in_time.value, "use_latest_restorable_time", null)
    }
  }


  dynamic "s3_import" {
    for_each = var.s3_import != null ? [var.s3_import] : []

    content {
      source_engine         = "mysql"
      source_engine_version = s3_import.value.source_engine_version
      bucket_name           = s3_import.value.bucket_name
      bucket_prefix         = lookup(s3_import.value, "bucket_prefix", null)
      ingestion_role        = s3_import.value.ingestion_role
    }
  }

  tags = merge(
    var.tags,
    {
      "Name" = format("%s", var.identifier)
    },
  )

  timeouts {
    create = lookup(var.timeouts, "create", null)
    delete = lookup(var.timeouts, "delete", null)
    update = lookup(var.timeouts, "update", null)
  }
}

resource "aws_db_instance" "this_mssql" {
  count = var.create && local.is_mssql ? 1 : 0

  identifier = var.identifier

  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type
  storage_encrypted = var.storage_encrypted
  kms_key_id        = var.kms_key_id
  license_model     = var.license_model

  name                                = var.name
  username                            = var.username
  password                            = var.password
  port                                = var.port
  domain                              = var.domain
  domain_iam_role_name                = var.domain_iam_role_name
  iam_database_authentication_enabled = var.iam_database_authentication_enabled

  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name   = var.db_subnet_group_name
  parameter_group_name   = var.parameter_group_name
  option_group_name      = var.option_group_name

  availability_zone   = var.availability_zone
  multi_az            = var.multi_az
  iops                = var.iops
  publicly_accessible = var.publicly_accessible
  ca_cert_identifier  = var.ca_cert_identifier

  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  apply_immediately           = var.apply_immediately
  maintenance_window          = var.maintenance_window

  snapshot_identifier   = var.snapshot_identifier
  copy_tags_to_snapshot = var.copy_tags_to_snapshot
  skip_final_snapshot   = var.skip_final_snapshot
  # TODO - remove coalesce() at next breaking change - adding existing name as fallback to maintain backwards compatibility
  final_snapshot_identifier = var.skip_final_snapshot ? null : coalesce(var.final_snapshot_identifier, "${var.final_snapshot_identifier_prefix}-${var.identifier}-${random_id.snapshot_identifier[0].hex}")

  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_retention_period = var.performance_insights_enabled ? var.performance_insights_retention_period : null
  performance_insights_kms_key_id       = var.performance_insights_enabled ? var.performance_insights_kms_key_id : null

  replicate_source_db     = var.replicate_source_db
  backup_retention_period = var.backup_retention_period
  backup_window           = var.backup_window
  max_allocated_storage   = var.max_allocated_storage
  monitoring_interval     = var.monitoring_interval
  monitoring_role_arn     = var.monitoring_interval > 0 ? local.monitoring_role_arn : null

  character_set_name              = var.character_set_name
  timezone                        = var.timezone # MSSQL only
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  deletion_protection      = var.deletion_protection
  delete_automated_backups = var.delete_automated_backups

  tags = merge(
    var.tags,
    {
      "Name" = format("%s", var.identifier)
    },
  )

  timeouts {
    create = lookup(var.timeouts, "create", null)
    delete = lookup(var.timeouts, "delete", null)
    update = lookup(var.timeouts, "update", null)
  }
}

################################################################################
# Enhanced monitoring
################################################################################

data "aws_iam_policy_document" "enhanced_monitoring" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["monitoring.rds.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "enhanced_monitoring" {
  count = var.create_monitoring_role ? 1 : 0

  name               = var.monitoring_role_name
  assume_role_policy = data.aws_iam_policy_document.enhanced_monitoring.json
  description        = var.monitoring_role_description

  tags = merge(
    {
      "Name" = format("%s", var.monitoring_role_name)
    },
    var.tags,
  )
}

resource "aws_iam_role_policy_attachment" "enhanced_monitoring" {
  count = var.create_monitoring_role ? 1 : 0

  role       = aws_iam_role.enhanced_monitoring[0].name
  policy_arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}

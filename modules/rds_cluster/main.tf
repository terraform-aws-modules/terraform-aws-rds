locals {
  final_snapshot_identifier = var.skip_final_snapshot ? null : "${var.final_snapshot_identifier_prefix}-${var.cluster_identifier}-${try(random_id.snapshot_identifier[0].hex, "")}"

  cluster_identifier        = var.use_cluster_identifier_prefix ? null : var.cluster_identifier
  cluster_identifier_prefix = var.use_cluster_identifier_prefix ? "${var.cluster_identifier}-" : null
}

resource "random_id" "snapshot_identifier" {
  count = var.create_cluster && !var.skip_final_snapshot ? 1 : 0

  keepers = {
    id = var.cluster_identifier
  }

  byte_length = 4
}

resource "aws_rds_cluster" "this" {
  count = var.create_cluster ? 1 : 0

  cluster_identifier        = local.cluster_identifier
  cluster_identifier_prefix = local.cluster_identifier_prefix

  # These attributes are required for multi-az deployments
  storage_type              = var.storage_type
  iops                      = var.iops
  allocated_storage         = var.allocated_storage
  db_cluster_instance_class = var.instance_class

  engine                          = var.engine
  engine_mode                     = var.engine_mode
  engine_version                  = var.engine_version
  allow_major_version_upgrade     = var.allow_major_version_upgrade
  kms_key_id                      = var.kms_key_id
  database_name                   = var.db_name
  master_username                 = var.username
  master_password                 = var.password
  final_snapshot_identifier       = local.final_snapshot_identifier
  skip_final_snapshot             = var.skip_final_snapshot
  deletion_protection             = var.deletion_protection
  backup_retention_period         = var.backup_retention_period
  preferred_backup_window         = var.backup_window
  preferred_maintenance_window    = var.maintenance_window
  port                            = var.port
  db_subnet_group_name            = var.db_subnet_group_name
  vpc_security_group_ids          = var.vpc_security_group_ids
  snapshot_identifier             = var.snapshot_identifier
  storage_encrypted               = var.storage_encrypted
  apply_immediately               = var.apply_immediately
  db_cluster_parameter_group_name = var.db_cluster_parameter_group_name
  copy_tags_to_snapshot           = var.copy_tags_to_snapshot
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  timeouts {
    create = lookup(var.cluster_timeouts, "create", null)
    update = lookup(var.cluster_timeouts, "update", null)
    delete = lookup(var.cluster_timeouts, "delete", null)
  }

  dynamic "restore_to_point_in_time" {
    for_each = var.restore_to_point_in_time != null ? [var.restore_to_point_in_time] : []

    content {
      source_cluster_identifier  = restore_to_point_in_time.value.source_cluster_identifier
      restore_type               = lookup(restore_to_point_in_time.value, "restore_type", null)
      use_latest_restorable_time = lookup(restore_to_point_in_time.value, "use_latest_restorable_time", null)
      restore_to_time            = lookup(restore_to_point_in_time.value, "restore_to_time", null)
    }
  }

  depends_on = [aws_cloudwatch_log_group.this]

  tags = merge(var.tags, var.cluster_tags)
}

################################################################################
# CloudWatch Log Group
################################################################################

resource "aws_cloudwatch_log_group" "this" {
  for_each = toset([for log in var.enabled_cloudwatch_logs_exports : log if var.create_cluster && var.create_cloudwatch_log_group])

  name              = "/aws/rds/cluster/${var.cluster_identifier}/${each.value}"
  retention_in_days = var.cloudwatch_log_group_retention_in_days
  kms_key_id        = var.cloudwatch_log_group_kms_key_id

  tags = var.tags
}

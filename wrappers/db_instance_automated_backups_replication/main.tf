module "wrapper" {
  source = "../../modules/db_instance_automated_backups_replication"

  for_each = var.items

  create                 = try(each.value.create, var.defaults.create, true)
  kms_key_arn            = try(each.value.kms_key_arn, var.defaults.kms_key_arn, null)
  pre_signed_url         = try(each.value.pre_signed_url, var.defaults.pre_signed_url, null)
  region                 = try(each.value.region, var.defaults.region, null)
  retention_period       = try(each.value.retention_period, var.defaults.retention_period, 7)
  source_db_instance_arn = try(each.value.source_db_instance_arn, var.defaults.source_db_instance_arn, null)
}

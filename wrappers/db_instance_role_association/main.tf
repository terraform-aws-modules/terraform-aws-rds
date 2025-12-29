module "wrapper" {
  source = "../../modules/db_instance_role_association"

  for_each = var.items

  create                 = try(each.value.create, var.defaults.create, true)
  db_instance_identifier = try(each.value.db_instance_identifier, var.defaults.db_instance_identifier, null)
  feature_name           = try(each.value.feature_name, var.defaults.feature_name, null)
  region                 = try(each.value.region, var.defaults.region, null)
  role_arn               = try(each.value.role_arn, var.defaults.role_arn, null)
}

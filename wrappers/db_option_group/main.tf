module "wrapper" {
  source = "../../modules/db_option_group"

  for_each = var.items

  create                   = try(each.value.create, var.defaults.create, true)
  engine_name              = try(each.value.engine_name, var.defaults.engine_name, null)
  major_engine_version     = try(each.value.major_engine_version, var.defaults.major_engine_version, null)
  name                     = try(each.value.name, var.defaults.name, "")
  option_group_description = try(each.value.option_group_description, var.defaults.option_group_description, null)
  options                  = try(each.value.options, var.defaults.options, null)
  region                   = try(each.value.region, var.defaults.region, null)
  skip_destroy             = try(each.value.skip_destroy, var.defaults.skip_destroy, null)
  tags                     = try(each.value.tags, var.defaults.tags, {})
  timeouts                 = try(each.value.timeouts, var.defaults.timeouts, null)
  use_name_prefix          = try(each.value.use_name_prefix, var.defaults.use_name_prefix, true)
}

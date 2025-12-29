module "wrapper" {
  source = "../../modules/db_parameter_group"

  for_each = var.items

  create          = try(each.value.create, var.defaults.create, true)
  description     = try(each.value.description, var.defaults.description, null)
  family          = try(each.value.family, var.defaults.family, null)
  name            = try(each.value.name, var.defaults.name, "")
  parameters      = try(each.value.parameters, var.defaults.parameters, null)
  region          = try(each.value.region, var.defaults.region, null)
  skip_destroy    = try(each.value.skip_destroy, var.defaults.skip_destroy, null)
  tags            = try(each.value.tags, var.defaults.tags, {})
  use_name_prefix = try(each.value.use_name_prefix, var.defaults.use_name_prefix, true)
}

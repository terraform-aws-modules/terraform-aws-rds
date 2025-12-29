module "wrapper" {
  source = "../../modules/db_subnet_group"

  for_each = var.items

  create          = try(each.value.create, var.defaults.create, true)
  description     = try(each.value.description, var.defaults.description, null)
  name            = try(each.value.name, var.defaults.name, "")
  region          = try(each.value.region, var.defaults.region, null)
  subnet_ids      = try(each.value.subnet_ids, var.defaults.subnet_ids, [])
  tags            = try(each.value.tags, var.defaults.tags, {})
  use_name_prefix = try(each.value.use_name_prefix, var.defaults.use_name_prefix, true)
}

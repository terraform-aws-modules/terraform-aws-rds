resource "aws_db_option_group" "this" {
  count = var.create ? 1 : 0

  name_prefix              = var.name_prefix
  option_group_description = var.option_group_description == "" ? format("Option group for %s", var.identifier) : var.option_group_description
  engine_name              = var.engine_name
  major_engine_version     = var.major_engine_version

  dynamic "option" {
    for_each = var.options
    content {
      db_security_group_memberships  = lookup(option.value, "db_security_group_memberships", null)
      option_name                    = option.value.option_name
      port                           = lookup(option.value, "port", null)
      version                        = lookup(option.value, "version", null)
      vpc_security_group_memberships = lookup(option.value, "vpc_security_group_memberships", null)

      dynamic "option_settings" {
        for_each = lookup(option.value, "option_settings", [])
        content {
          name  = option_settings.value.name
          value = option_settings.value.value
        }
      }
    }
  }

  tags = merge(
    var.tags,
    {
      "Name" = format("%s", var.identifier)
    },
  )

  lifecycle {
    create_before_destroy = true
  }
}


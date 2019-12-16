locals {
  description = coalesce(var.description, "Database option group for ${var.identifier}")
  name_prefix = coalesce(var.name_prefix, var.identifier)
  name        = coalesce(var.name, var.identifier)
}

resource "aws_db_option_group" "this" {
  count = var.create && var.use_name_prefix ? 1 : 0

  name_prefix              = "${lower(local.name_prefix)}-"
  option_group_description = local.description
  engine_name              = var.engine_name
  major_engine_version     = var.major_engine_version

  dynamic "option" {
    for_each = var.options
    content {
      option_name                    = option.value.option_name
      port                           = lookup(option.value, "port", null)
      version                        = lookup(option.value, "version", null)
      db_security_group_memberships  = lookup(option.value, "db_security_group_memberships", null)
      vpc_security_group_memberships = lookup(option.value, "vpc_security_group_memberships", null)

      dynamic "option_settings" {
        for_each = lookup(option.value, "option_settings", [])
        content {
          name  = lookup(option_settings.value, "name", null)
          value = lookup(option_settings.value, "value", null)
        }
      }
    }
  }

  tags = merge(
    var.tags,
    {
      "Name" = format("%s", local.name_prefix)
    },
  )

  lifecycle {
    create_before_destroy = true
  }

  timeouts {
    delete = lookup(var.timeouts, "delete", null)
  }
}

resource "aws_db_option_group" "this_no_prefix" {
  count = var.create && ! var.use_name_prefix ? 1 : 0

  name                     = local.name
  option_group_description = local.description
  engine_name              = var.engine_name
  major_engine_version     = var.major_engine_version

  dynamic "option" {
    for_each = var.options
    content {
      option_name                    = option.value.option_name
      port                           = lookup(option.value, "port", null)
      version                        = lookup(option.value, "version", null)
      db_security_group_memberships  = lookup(option.value, "db_security_group_memberships", null)
      vpc_security_group_memberships = lookup(option.value, "vpc_security_group_memberships", null)

      dynamic "option_settings" {
        for_each = lookup(option.value, "option_settings", [])
        content {
          name  = lookup(option_settings.value, "name", null)
          value = lookup(option_settings.value, "value", null)
        }
      }
    }
  }

  tags = merge(
    var.tags,
    {
      "Name" = format("%s", local.name)
    },
  )

  lifecycle {
    create_before_destroy = true
  }

  timeouts {
    delete = lookup(var.timeouts, "delete", null)
  }
}

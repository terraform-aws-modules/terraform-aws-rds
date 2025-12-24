locals {
  name        = var.use_name_prefix ? null : var.name
  name_prefix = var.use_name_prefix ? "${var.name}-" : null

  description = coalesce(var.option_group_description, format("%s option group", var.name))
}

resource "aws_db_option_group" "this" {
  count = var.create ? 1 : 0

  name                     = local.name
  name_prefix              = local.name_prefix
  option_group_description = local.description
  engine_name              = var.engine_name
  major_engine_version     = var.major_engine_version

  dynamic "option" {
    for_each = var.options != null ? var.options : []
    content {
      option_name                    = option.value.option_name
      port                           = option.value.port
      version                        = option.value.version
      db_security_group_memberships  = option.value.db_security_group_memberships
      vpc_security_group_memberships = option.value.vpc_security_group_memberships

      dynamic "option_settings" {
        for_each = option.value.option_settings != null ? option.value.option_settings : []
        content {
          name  = option_settings.value.name
          value = option_settings.value.value
        }
      }
    }
  }

  region       = var.region
  skip_destroy = var.skip_destroy

  tags = merge(
    var.tags,
    {
      "Name" = var.name
    },
  )

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []

    content {
      delete = timeouts.value.delete
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

locals {
  description = coalesce(var.description, "Database subnet group for ${var.identifier}")
  name_prefix = coalesce(var.name_prefix, var.identifier)
  name        = coalesce(var.name, var.identifier)
}

resource "aws_db_subnet_group" "this" {
  count = var.create && var.use_name_prefix ? 1 : 0

  name_prefix = "${lower(local.name_prefix)}-"
  description = local.description
  subnet_ids  = var.subnet_ids

  tags = merge(
    var.tags,
    {
      "Name" = format("%s", local.name_prefix)
    },
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_db_subnet_group" "this_no_prefix" {
  count = var.create && ! var.use_name_prefix ? 1 : 0

  name        = lower(local.name)
  description = local.description
  subnet_ids  = var.subnet_ids

  tags = merge(
    var.tags,
    {
      "Name" = format("%s", local.name)
    },
  )

  lifecycle {
    create_before_destroy = true
  }
}

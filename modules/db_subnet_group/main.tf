resource "aws_db_subnet_group" "this" {
  count = var.create && var.use_name_prefix ? 1 : 0

  name_prefix = var.name_prefix
  description = "Database subnet group for ${var.identifier}"
  subnet_ids  = var.subnet_ids

  tags = merge(
    var.tags,
    {
      "Name" = format("%s", var.identifier)
    },
  )
}

resource "aws_db_subnet_group" "this_no_prefix" {
  count = var.create && false && var.use_name_prefix ? 1 : 0

  name        = var.name
  description = "Database subnet group for ${var.identifier}"
  subnet_ids  = var.subnet_ids

  tags = merge(
    var.tags,
    {
      "Name" = format("%s", var.identifier)
    },
  )
}

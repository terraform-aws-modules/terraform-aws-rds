resource "aws_db_subnet_group" "this" {
  count = var.create ? 1 : 0

  name        = var.use_name_prefix ? null : lower(var.name)
  name_prefix = var.use_name_prefix ? "${lower(var.name)}-" : null
  description = "Database subnet group for ${var.identifier}"
  subnet_ids  = var.subnet_ids

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


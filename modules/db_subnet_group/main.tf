resource "aws_db_subnet_group" "this" {
  count = var.create ? 1 : 0

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


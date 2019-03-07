locals {
  description = "${coalesce(var.description, "Database parameter group for ${var.identifier}")}"
}

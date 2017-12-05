#####################
# DB parameter group
#####################
resource "aws_db_parameter_group" "this" {
  count = "${var.count}"

  name_prefix = "${var.name_prefix}"
  description = "Database parameter group for ${var.identifier}"
  family      = "${var.family}"

  parameter = ["${var.parameters}"]

  tags = "${merge(var.tags, map("Name", format("%s", var.identifier)))}"

  lifecycle {
    create_before_destroy = true
  }
}

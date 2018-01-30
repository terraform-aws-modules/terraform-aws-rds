#####################
# DB option group
#####################
resource "aws_db_option_group" "this" {
  count = "${var.count}"

  name_prefix              = "${var.name_prefix}"
  option_group_description = "${var.option_group_description == "" ? format("Option group for %s", var.identifier) : var.option_group_description}"
  engine_name              = "${var.engine_name}"
  major_engine_version     = "${var.major_engine_version}"

  option = ["${var.options}"]

  tags = "${merge(var.tags, map("Name", format("%s", var.identifier)))}"
}

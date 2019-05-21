resource "aws_db_option_group" "this_no_prefix" {
  count = "${var.create && ! var.use_name_prefix ? 1 : 0}"

  name                     = "${var.name}"
  option_group_description = "${var.option_group_description == "" ? format("Option group for %s", var.identifier) : var.option_group_description}"
  engine_name              = "${var.engine_name}"
  major_engine_version     = "${var.major_engine_version}"

  option = ["${var.options}"]

  tags = "${merge(var.tags, map("Name", format("%s", var.name)))}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_db_option_group" "this" {

  count = "${var.create && var.use_name_prefix ? 1 : 0}"

  name_prefix              = "${var.name_prefix}"
  option_group_description = "${var.option_group_description == "" ? format("Option group for %s", var.identifier) : var.option_group_description}"
  engine_name              = "${var.engine_name}"
  major_engine_version     = "${var.major_engine_version}"

  option = ["${var.options}"]

  tags = "${merge(var.tags, map("Name", format("%s", var.identifier)))}"

  lifecycle {
    create_before_destroy = true
  }
}

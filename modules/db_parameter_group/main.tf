#####################
# DB parameter group
#####################
resource "aws_db_parameter_group" "this" {
  count = "${var.count}"

  name_prefix = "${var.name_prefix}"
  description = "Database parameter group for ${var.identifier}"
  family      = "${var.family}"

  // @todo: implement this
  //  parameter = ["${var.parameters}"]

  //  parameter = [
  //    {
  //      name  = "character_set_server"
  //      value = "utf8"
  //    },
  //    {
  //      name  = "character_set_client"
  //      value = "utf18"
  //    },
  //  ]
  parameter {
    name  = "character_set_server"
    value = "utf8"
  }
  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
  tags = "${merge(var.tags, map("Name", format("%s", var.identifier)))}"
}

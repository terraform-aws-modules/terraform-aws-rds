# DB subnet group
output "this_db_subnet_group_id" {
  description = "The db subnet group name"
  value       = "${var.count == 0 ? "" : aws_db_subnet_group.this.id}"
}

output "this_db_subnet_group_arn" {
  description = "The ARN of the db subnet group"
  value       = "${aws_db_subnet_group.this.arn}"
}

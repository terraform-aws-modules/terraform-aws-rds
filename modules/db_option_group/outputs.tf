# DB option group
output "this_db_option_group_id" {
  description = "The db option group id"
  value       = "${aws_db_option_group.this.id}"
}

output "this_db_option_group_arn" {
  description = "The ARN of the db option group"
  value       = "${aws_db_option_group.this.arn}"
}

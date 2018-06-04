output "this_db_option_group_id" {
  description = "The db option group id"
  value       = "${element(split(",", join(",", aws_db_option_group.this.*.id)), 0)}"
}

output "this_db_option_group_arn" {
  description = "The ARN of the db option group"
  value       = "${element(split(",", join(",", aws_db_option_group.this.*.arn)), 0)}"
}

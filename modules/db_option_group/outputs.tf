output "this_db_option_group_id" {
  description = "The db option group id"
  value       = element(concat(aws_db_option_group.this.*.id, aws_db_option_group.this_no_prefix.*.id, [""]), 0)
}

output "this_db_option_group_arn" {
  description = "The ARN of the db option group"
  value       = element(concat(aws_db_option_group.this.*.arn, aws_db_option_group.this_no_prefix.*.arn, [""]), 0)
}


output "db_option_group_id" {
  description = "The db option group id"
  value       = element(concat(aws_db_option_group.this.*.id, [""]), 0)
}

output "db_option_group_arn" {
  description = "The ARN of the db option group"
  value       = element(concat(aws_db_option_group.this.*.arn, [""]), 0)
}


output "this_db_parameter_group_id" {
  description = "The db parameter group id"
  value       = element(concat(aws_db_parameter_group.this.*.id, aws_db_parameter_group.this_no_prefix.*.id, [""]), 0)
}

output "this_db_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = element(concat(aws_db_parameter_group.this.*.arn, aws_db_parameter_group.this_no_prefix.*.arn, [""]), 0)
}


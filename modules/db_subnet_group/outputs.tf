output "this_db_subnet_group_id" {
  description = "The db subnet group name"
  value       = element(concat(aws_db_subnet_group.this.*.id, aws_db_subnet_group.this_no_prefix.*.id, [""]), 0)
}

output "this_db_subnet_group_arn" {
  description = "The ARN of the db subnet group"
  value       = element(concat(aws_db_subnet_group.this.*.arn, aws_db_subnet_group.this_no_prefix.*.arn, [""]), 0)
}


output "db_instance_role_association_id" {
  description = "DB Instance Identifier and IAM Role ARN separated by a comma"
  value       = try(aws_db_instance_role_association.this[0].id, "")
}

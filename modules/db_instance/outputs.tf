output "enhanced_monitoring_iam_role_name" {
  description = "The name of the monitoring role"
  value       = try(aws_iam_role.enhanced_monitoring[0].name, "")
}

output "enhanced_monitoring_iam_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the monitoring role"
  value       = try(aws_iam_role.enhanced_monitoring[0].arn, "")
}

output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = try(aws_db_instance.this[0].address, "")
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = try(aws_db_instance.this[0].arn, "")
}

output "db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = try(aws_db_instance.this[0].availability_zone, "")
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = try(aws_db_instance.this[0].endpoint, "")
}

output "db_instance_engine" {
  description = "The database engine"
  value       = try(aws_db_instance.this[0].engine, "")
}

output "db_instance_engine_version_actual" {
  description = "The running version of the database"
  value       = try(aws_db_instance.this[0].engine_version_actual, "")
}

output "db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = try(aws_db_instance.this[0].hosted_zone_id, "")
}

output "db_instance_id" {
  description = "The RDS instance ID"
  value       = try(aws_db_instance.this[0].id, "")
}

output "db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = try(aws_db_instance.this[0].resource_id, "")
}

output "db_instance_status" {
  description = "The RDS instance status"
  value       = try(aws_db_instance.this[0].status, "")
}

output "db_instance_name" {
  description = "The database name"
  value       = try(aws_db_instance.this[0].name, "")
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = try(aws_db_instance.this[0].username, "")
  sensitive   = true
}

output "db_instance_port" {
  description = "The database port"
  value       = try(aws_db_instance.this[0].port, "")
}

output "db_instance_ca_cert_identifier" {
  description = "Specifies the identifier of the CA certificate for the DB instance"
  value       = try(aws_db_instance.this[0].ca_cert_identifier, "")
}

output "db_instance_domain" {
  description = "The ID of the Directory Service Active Directory domain the instance is joined to"
  value       = try(aws_db_instance.this[0].domain, "")
}

output "db_instance_domain_iam_role_name" {
  description = "The name of the IAM role to be used when making API calls to the Directory Service. "
  value       = try(aws_db_instance.this[0].domain_iam_role_name, "")
}

output "db_instance_password" {
  description = "The master password"
  value       = try(aws_db_instance.this[0].password, "")
  sensitive   = true
}

################################################################################
# CloudWatch Log Group
################################################################################

output "db_instance_cloudwatch_log_groups" {
  description = "Map of CloudWatch log groups created and their attributes"
  value       = aws_cloudwatch_log_group.this
}

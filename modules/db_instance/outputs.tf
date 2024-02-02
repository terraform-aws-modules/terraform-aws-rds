output "enhanced_monitoring_iam_role_name" {
  description = "The name of the monitoring role"
  value       = try(aws_iam_role.enhanced_monitoring[0].name, null)
}

output "enhanced_monitoring_iam_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the monitoring role"
  value       = try(aws_iam_role.enhanced_monitoring[0].arn, null)
}

output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = try(aws_db_instance.this[0].address, null)
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = try(aws_db_instance.this[0].arn, null)
}

output "db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = try(aws_db_instance.this[0].availability_zone, null)
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = try(aws_db_instance.this[0].endpoint, null)
}

output "db_listener_endpoint" {
  description = "Specifies the listener connection endpoint for SQL Server Always On"
  value       = try(aws_db_instance.this[0].listener_endpoint, null)
}

output "db_instance_engine" {
  description = "The database engine"
  value       = try(aws_db_instance.this[0].engine, null)
}

output "db_instance_engine_version_actual" {
  description = "The running version of the database"
  value       = try(aws_db_instance.this[0].engine_version_actual, null)
}

output "db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = try(aws_db_instance.this[0].hosted_zone_id, null)
}

output "db_instance_identifier" {
  description = "The RDS instance identifier"
  value       = try(aws_db_instance.this[0].identifier, null)
}

output "db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = try(aws_db_instance.this[0].resource_id, null)
}

output "db_instance_status" {
  description = "The RDS instance status"
  value       = try(aws_db_instance.this[0].status, null)
}

output "db_instance_name" {
  description = "The database name"
  value       = try(aws_db_instance.this[0].db_name, null)
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = try(aws_db_instance.this[0].username, null)
  sensitive   = true
}

output "db_instance_port" {
  description = "The database port"
  value       = try(aws_db_instance.this[0].port, null)
}

output "db_instance_ca_cert_identifier" {
  description = "Specifies the identifier of the CA certificate for the DB instance"
  value       = try(aws_db_instance.this[0].ca_cert_identifier, null)
}

output "db_instance_domain" {
  description = "The ID of the Directory Service Active Directory domain the instance is joined to"
  value       = try(aws_db_instance.this[0].domain, null)
}

output "db_instance_domain_iam_role_name" {
  description = "The name of the IAM role to be used when making API calls to the Directory Service"
  value       = try(aws_db_instance.this[0].domain_iam_role_name, null)
}

output "db_instance_master_user_secret_arn" {
  description = "The ARN of the master user secret (Only available when manage_master_user_password is set to true)"
  value       = try(aws_db_instance.this[0].master_user_secret[0].secret_arn, null)
}

################################################################################
# CloudWatch Log Group
################################################################################

output "db_instance_cloudwatch_log_groups" {
  description = "Map of CloudWatch log groups created and their attributes"
  value       = aws_cloudwatch_log_group.this
}

################################################################################
# Managed Secret Rotation
################################################################################

output "db_instance_secretsmanager_secret_rotation_enabled" {
  description = "Specifies whether automatic rotation is enabled for the secret"
  value       = try(aws_secretsmanager_secret_rotation.this[0].rotation_enabled, null)
}

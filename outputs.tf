output "enhanced_monitoring_iam_role_name" {
  description = "The name of the monitoring role"
  value       = module.db_instance.enhanced_monitoring_iam_role_name
}

output "enhanced_monitoring_iam_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the monitoring role"
  value       = module.db_instance.enhanced_monitoring_iam_role_arn
}

output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.db_instance.db_instance_address
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.db_instance.db_instance_arn
}

output "db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = module.db_instance.db_instance_availability_zone
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.db_instance.db_instance_endpoint
}

output "db_listener_endpoint" {
  description = "Specifies the listener connection endpoint for SQL Server Always On"
  value       = module.db_instance.db_listener_endpoint
}

output "db_instance_engine" {
  description = "The database engine"
  value       = module.db_instance.db_instance_engine
}

output "db_instance_engine_version_actual" {
  description = "The running version of the database"
  value       = module.db_instance.db_instance_engine_version_actual
}

output "db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = module.db_instance.db_instance_hosted_zone_id
}

output "db_instance_identifier" {
  description = "The RDS instance identifier"
  value       = module.db_instance.db_instance_identifier
}

output "db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = module.db_instance.db_instance_resource_id
}

output "db_instance_status" {
  description = "The RDS instance status"
  value       = module.db_instance.db_instance_status
}

output "db_instance_name" {
  description = "The database name"
  value       = module.db_instance.db_instance_name
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = module.db_instance.db_instance_username
  sensitive   = true
}

output "db_instance_domain" {
  description = "The ID of the Directory Service Active Directory domain the instance is joined to"
  value       = module.db_instance.db_instance_domain
}

output "db_instance_domain_iam_role_name" {
  description = "The name of the IAM role to be used when making API calls to the Directory Service"
  value       = module.db_instance.db_instance_domain_iam_role_name
}

output "db_instance_port" {
  description = "The database port"
  value       = module.db_instance.db_instance_port
}

output "db_instance_ca_cert_identifier" {
  description = "Specifies the identifier of the CA certificate for the DB instance"
  value       = module.db_instance.db_instance_ca_cert_identifier
}

output "db_instance_master_user_secret_arn" {
  description = "The ARN of the master user secret (Only available when manage_master_user_password is set to true)"
  value       = module.db_instance.db_instance_master_user_secret_arn
}

output "db_subnet_group_id" {
  description = "The db subnet group name"
  value       = module.db_subnet_group.db_subnet_group_id
}

output "db_subnet_group_arn" {
  description = "The ARN of the db subnet group"
  value       = module.db_subnet_group.db_subnet_group_arn
}

output "db_parameter_group_id" {
  description = "The db parameter group id"
  value       = module.db_parameter_group.db_parameter_group_id
}

output "db_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = module.db_parameter_group.db_parameter_group_arn
}

# DB option group
output "db_option_group_id" {
  description = "The db option group id"
  value       = module.db_option_group.db_option_group_id
}

output "db_option_group_arn" {
  description = "The ARN of the db option group"
  value       = module.db_option_group.db_option_group_arn
}

################################################################################
# CloudWatch Log Group
################################################################################

output "db_instance_cloudwatch_log_groups" {
  description = "Map of CloudWatch log groups created and their attributes"
  value       = module.db_instance.db_instance_cloudwatch_log_groups
}

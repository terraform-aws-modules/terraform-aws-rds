output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.db.db_instance_address
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.db.db_instance_arn
}

output "db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = module.db.db_instance_availability_zone
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.db.db_instance_endpoint
}

output "db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = module.db.db_instance_hosted_zone_id
}

output "db_instance_id" {
  description = "The RDS instance ID"
  value       = module.db.db_instance_id
}

output "db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = module.db.db_instance_resource_id
}

output "db_instance_status" {
  description = "The RDS instance status"
  value       = module.db.db_instance_status
}

output "db_instance_name" {
  description = "The database name"
  value       = module.db.db_instance_name
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = module.db.db_instance_username
  sensitive   = true
}

output "db_instance_password" {
  description = "The database password (this password may be old, because Terraform doesn't track it after initial creation)"
  value       = module.db.db_instance_password
  sensitive   = true
}

output "db_instance_port" {
  description = "The database port"
  value       = module.db.db_instance_port
}

output "db_subnet_group_id" {
  description = "The db subnet group name"
  value       = module.db.db_subnet_group_id
}

output "db_subnet_group_arn" {
  description = "The ARN of the db subnet group"
  value       = module.db.db_subnet_group_arn
}

output "db_parameter_group_id" {
  description = "The db parameter group id"
  value       = module.db.db_parameter_group_id
}

output "db_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = module.db.db_parameter_group_arn
}

output "db_enhanced_monitoring_iam_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the monitoring role"
  value       = module.db.enhanced_monitoring_iam_role_arn
}

# Default
output "db_default_instance_address" {
  description = "The address of the RDS instance"
  value       = module.db_default.db_instance_address
}

output "db_default_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.db_default.db_instance_arn
}

output "db_default_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = module.db_default.db_instance_availability_zone
}

output "db_default_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.db_default.db_instance_endpoint
}

output "db_default_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = module.db_default.db_instance_hosted_zone_id
}

output "db_default_instance_id" {
  description = "The RDS instance ID"
  value       = module.db_default.db_instance_id
}

output "db_default_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = module.db_default.db_instance_resource_id
}

output "db_default_instance_status" {
  description = "The RDS instance status"
  value       = module.db_default.db_instance_status
}

output "db_default_instance_name" {
  description = "The database name"
  value       = module.db_default.db_instance_name
}

output "db_default_instance_username" {
  description = "The master username for the database"
  value       = module.db_default.db_instance_username
  sensitive   = true
}

output "db_default_instance_password" {
  description = "The database password (this password may be old, because Terraform doesn't track it after initial creation)"
  value       = module.db_default.db_instance_password
  sensitive   = true
}

output "db_default_instance_port" {
  description = "The database port"
  value       = module.db_default.db_instance_port
}

output "db_default_subnet_group_id" {
  description = "The db subnet group name"
  value       = module.db_default.db_subnet_group_id
}

output "db_default_subnet_group_arn" {
  description = "The ARN of the db subnet group"
  value       = module.db_default.db_subnet_group_arn
}

output "db_default_parameter_group_id" {
  description = "The db parameter group id"
  value       = module.db_default.db_parameter_group_id
}

output "db_default_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = module.db_default.db_parameter_group_arn
}

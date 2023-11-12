# postgresql
output "postgres_db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.postgres.db_instance_address
}

output "postgres_db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.postgres.db_instance_arn
}

output "postgres_db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = module.postgres.db_instance_availability_zone
}

output "postgres_db_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.postgres.db_instance_endpoint
}

output "postgres_db_instance_engine" {
  description = "The database engine"
  value       = module.postgres.db_instance_engine
}

output "postgres_db_instance_engine_version_actual" {
  description = "The running version of the database"
  value       = module.postgres.db_instance_engine_version_actual
}

output "postgres_db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = module.postgres.db_instance_hosted_zone_id
}

output "postgres_db_instance_identifier" {
  description = "The RDS instance identifier"
  value       = module.postgres.db_instance_identifier
}

output "postgres_db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = module.postgres.db_instance_resource_id
}

output "postgres_db_instance_status" {
  description = "The RDS instance status"
  value       = module.postgres.db_instance_status
}

output "postgres_db_instance_name" {
  description = "The database name"
  value       = module.postgres.db_instance_name
}

output "postgres_db_instance_username" {
  description = "The master username for the database"
  value       = module.postgres.db_instance_username
  sensitive   = true
}

output "postgres_db_instance_port" {
  description = "The database port"
  value       = module.postgres.db_instance_port
}

output "postgres_db_subnet_group_id" {
  description = "The db subnet group name"
  value       = module.postgres.db_subnet_group_id
}

output "postgres_db_subnet_group_arn" {
  description = "The ARN of the db subnet group"
  value       = module.postgres.db_subnet_group_arn
}

output "postgres_db_parameter_group_id" {
  description = "The db parameter group id"
  value       = module.postgres.db_parameter_group_id
}

output "postgres_db_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = module.postgres.db_parameter_group_arn
}

output "postgres_db_instance_cloudwatch_log_groups" {
  description = "Map of CloudWatch log groups created and their attributes"
  value       = module.postgres.db_instance_cloudwatch_log_groups
}

# mysql
output "mysql_db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.mysql.db_instance_address
}

output "mysql_db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.mysql.db_instance_arn
}

output "mysql_db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = module.mysql.db_instance_availability_zone
}

output "mysql_db_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.mysql.db_instance_endpoint
}

output "mysql_db_instance_engine" {
  description = "The database engine"
  value       = module.mysql.db_instance_engine
}

output "mysql_db_instance_engine_version_actual" {
  description = "The running version of the database"
  value       = module.mysql.db_instance_engine_version_actual
}

output "mysql_db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = module.mysql.db_instance_hosted_zone_id
}

output "mysql_db_instance_identifier" {
  description = "The RDS instance identifier"
  value       = module.mysql.db_instance_identifier
}

output "mysql_db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = module.mysql.db_instance_resource_id
}

output "db_instance_status" {
  description = "The RDS instance status"
  value       = module.mysql.db_instance_status
}

output "mysql_db_instance_name" {
  description = "The database name"
  value       = module.mysql.db_instance_name
}

output "mysql_db_instance_username" {
  description = "The master username for the database"
  value       = module.mysql.db_instance_username
  sensitive   = true
}

output "mysql_db_instance_port" {
  description = "The database port"
  value       = module.mysql.db_instance_port
}

output "mysql_db_subnet_group_id" {
  description = "The db subnet group name"
  value       = module.mysql.db_subnet_group_id
}

output "mysql_db_subnet_group_arn" {
  description = "The ARN of the db subnet group"
  value       = module.mysql.db_subnet_group_arn
}

output "mysql_db_parameter_group_id" {
  description = "The db parameter group id"
  value       = module.mysql.db_parameter_group_id
}

output "mysql_db_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = module.mysql.db_parameter_group_arn
}

output "mysql_db_instance_cloudwatch_log_groups" {
  description = "Map of CloudWatch log groups created and their attributes"
  value       = module.mysql.db_instance_cloudwatch_log_groups
}

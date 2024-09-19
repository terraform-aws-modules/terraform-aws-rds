# Default PostgreSQL
output "default_postgres_option_group_id" {
  description = "The ID of the default PostgreSQL option group (should be blank)"
  value       = module.default_postgres.db_option_group_id
}

output "default_postgres_option_group_arn" {
  description = "The ARN of the default PostgreSQL option group (should be blank)"
  value       = module.default_postgres.db_option_group_arn
}

output "default_postgres_parameter_group_id" {
  description = "The db parameter group id"
  value       = module.default_postgres.db_parameter_group_id
}

output "default_postgres_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = module.default_postgres.db_parameter_group_arn
}

# Default MySQL
output "default_mysql_option_group_id" {
  description = "The ID of the default MySQL option group"
  value       = module.default_mysql.db_option_group_id
}

output "default_mysql_option_group_arn" {
  description = "The ARN of the default MySQL option group"
  value       = module.default_mysql.db_option_group_arn
}

output "default_mysql_parameter_group_id" {
  description = "The db parameter group id"
  value       = module.default_mysql.db_parameter_group_id
}

output "default_mysql_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = module.default_mysql.db_parameter_group_arn
}

# Default MySQL name
output "default_mysql_name_option_group_id" {
  description = "The ID of the default MySQL option group using `name`"
  value       = module.default_mysql_name.db_option_group_id
}

output "default_mysql_name_option_group_arn" {
  description = "The ARN of the default MySQL option group using `name`"
  value       = module.default_mysql_name.db_option_group_arn
}

output "default_mysql_name_parameter_group_id" {
  description = "The db parameter group id"
  value       = module.default_mysql_name.db_parameter_group_id
}

output "default_mysql_name_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = module.default_mysql_name.db_parameter_group_arn
}

# Default MySQL default AWS groups
output "default_mysql_default_aws_option_group_id" {
  description = "The ID of the default MySQL option group"
  value       = module.default_mysql_default_aws.db_option_group_id
}

output "default_mysql_default_aws_option_group_arn" {
  description = "The ARN of the default MySQL option group"
  value       = module.default_mysql_default_aws.db_option_group_arn
}

output "default_mysql_default_aws_parameter_group_id" {
  description = "The db parameter group id"
  value       = module.default_mysql_default_aws.db_parameter_group_id
}

output "default_mysql_default_aws_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = module.default_mysql_default_aws.db_parameter_group_arn
}

# BYO MySQL
output "byo_mysql_option_group_id" {
  description = "The ID of the BYO MySQL option group (should be blank)"
  value       = module.byo_mysql.db_option_group_id
}

output "byo_mysql_option_group_arn" {
  description = "The ARN of the BYO MySQL option group (should be blank)"
  value       = module.byo_mysql.db_option_group_arn
}

output "byo_mysql_parameter_group_id" {
  description = "The db parameter group id"
  value       = module.byo_mysql.db_parameter_group_id
}

output "byo_mysql_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = module.byo_mysql.db_parameter_group_arn
}

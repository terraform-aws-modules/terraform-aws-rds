# DB instance
output "this_db_instance_address" {
  description = "The address of the RDS instance"
  value       = "${module.db_instance.this_db_instance_address}"
}

output "this_db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = "${module.db_instance.this_db_instance_arn}"
}

output "this_db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = "${module.db_instance.this_db_instance_availability_zone}"
}

output "this_db_instance_endpoint" {
  description = "The connection endpoint"
  value       = "${module.db_instance.this_db_instance_endpoint}"
}

output "this_db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = "${module.db_instance.this_db_instance_hosted_zone_id}"
}

output "this_db_instance_id" {
  description = "The RDS instance ID"
  value       = "${module.db_instance.this_db_instance_id}"
}

output "this_db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = "${module.db_instance.this_db_instance_resource_id}"
}

output "this_db_instance_status" {
  description = "The RDS instance status"
  value       = "${module.db_instance.this_db_instance_status}"
}

output "this_db_instance_name" {
  description = "The database name"
  value       = "${module.db_instance.this_db_instance_name}"
}

output "this_db_instance_username" {
  description = "The master username for the database"
  value       = "${module.db_instance.this_db_instance_username}"
}

output "this_db_instance_password" {
  description = "The database password (this password may be old, because Terraform doesn't track it after initial creation)"
  value       = "${var.password}"
}

output "this_db_instance_port" {
  description = "The database port"
  value       = "${module.db_instance.this_db_instance_port}"
}

# DB subnet group
output "this_db_subnet_group_id" {
  description = "The db subnet group name"
  value       = "${module.db_subnet_group.this_db_subnet_group_id}"
}

output "this_db_subnet_group_arn" {
  description = "The ARN of the db subnet group"
  value       = "${module.db_subnet_group.this_db_subnet_group_arn}"
}

# DB parameter group
output "this_db_parameter_group_id" {
  description = "The db parameter group id"
  value       = "${module.db_parameter_group.this_db_parameter_group_id}"
}

output "this_db_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = "${module.db_parameter_group.this_db_parameter_group_arn}"
}

# DB option group
output "this_db_option_group_id" {
  description = "The db option group id"
  value       = "${module.db_option_group.this_db_option_group_id}"
}

output "this_db_option_group_arn" {
  description = "The ARN of the db option group"
  value       = "${module.db_option_group.this_db_option_group_arn}"
}

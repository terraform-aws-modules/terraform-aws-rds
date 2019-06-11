locals {
  this_db_instance_address           = element(concat(aws_db_instance.this_mssql.*.address, aws_db_instance.this.*.address, [""]), 0)
  this_db_instance_arn               = element(concat(aws_db_instance.this_mssql.*.arn, aws_db_instance.this.*.arn, [""]), 0)
  this_db_instance_availability_zone = element(concat(aws_db_instance.this_mssql.*.availability_zone, aws_db_instance.this.*.availability_zone, [""]), 0)
  this_db_instance_endpoint          = element(concat(aws_db_instance.this_mssql.*.endpoint, aws_db_instance.this.*.endpoint, [""]), 0)
  this_db_instance_hosted_zone_id    = element(concat(aws_db_instance.this_mssql.*.hosted_zone_id, aws_db_instance.this.*.hosted_zone_id, [""]), 0)
  this_db_instance_id                = element(concat(aws_db_instance.this_mssql.*.id, aws_db_instance.this.*.id, [""]), 0)
  this_db_instance_resource_id       = element(concat(aws_db_instance.this_mssql.*.resource_id, aws_db_instance.this.*.resource_id, [""]), 0)
  this_db_instance_status            = element(concat(aws_db_instance.this_mssql.*.status, aws_db_instance.this.*.status, [""]), 0)
  this_db_instance_name              = element(concat(aws_db_instance.this_mssql.*.name, aws_db_instance.this.*.name, [""]), 0)
  this_db_instance_username          = element(concat(aws_db_instance.this_mssql.*.username, aws_db_instance.this.*.username, [""]), 0)
  this_db_instance_port              = element(concat(aws_db_instance.this_mssql.*.port, aws_db_instance.this.*.port, [""]), 0)
}

output "this_db_instance_address" {
  description = "The address of the RDS instance"
  value       = local.this_db_instance_address
}

output "this_db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = local.this_db_instance_arn
}

output "this_db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = local.this_db_instance_availability_zone
}

output "this_db_instance_endpoint" {
  description = "The connection endpoint"
  value       = local.this_db_instance_endpoint
}

output "this_db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = local.this_db_instance_hosted_zone_id
}

output "this_db_instance_id" {
  description = "The RDS instance ID"
  value       = local.this_db_instance_id
}

output "this_db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = local.this_db_instance_resource_id
}

output "this_db_instance_status" {
  description = "The RDS instance status"
  value       = local.this_db_instance_status
}

output "this_db_instance_name" {
  description = "The database name"
  value       = local.this_db_instance_name
}

output "this_db_instance_username" {
  description = "The master username for the database"
  value       = local.this_db_instance_username
}

output "this_db_instance_port" {
  description = "The database port"
  value       = local.this_db_instance_port
}


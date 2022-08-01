output "rds_cluster_arn" {
  description = "Amazon Resource Name (ARN) of cluster"
  value       = module.rds_cluster.rds_cluster_arn
}

output "rds_cluster_id" {
  description = "The RDS Cluster Identifier"
  value       = module.rds_cluster.rds_cluster_id
}

output "rds_cluster_resource_id" {
  description = "The RDS Cluster Resource ID"
  value       = module.rds_cluster.rds_cluster_resource_id
}

output "rds_cluster_members" {
  description = "List of RDS Instances that are a part of this cluster"
  value       = module.rds_cluster.rds_cluster_members
}

output "rds_cluster_endpoint" {
  description = "Writer endpoint for the cluster"
  value       = module.rds_cluster.rds_cluster_endpoint
}

output "rds_cluster_reader_endpoint" {
  description = "A read-only endpoint for the cluster, automatically load-balanced across replicas"
  value       = module.rds_cluster.rds_cluster_reader_endpoint
}

output "rds_cluster_engine_version_actual" {
  description = "The running version of the cluster database"
  value       = module.rds_cluster.rds_cluster_engine_version_actual
}

output "rds_cluster_database_name" {
  description = "Name for an automatically created database on cluster creation"
  value       = module.rds_cluster.rds_cluster_database_name
}

output "rds_cluster_port" {
  description = "The database port"
  value       = module.rds_cluster.rds_cluster_port
}

output "rds_cluster_master_password" {
  description = "The database master password"
  value       = module.rds_cluster.rds_cluster_master_password
  sensitive   = true
}

output "rds_cluster_master_username" {
  description = "The database master username"
  value       = module.rds_cluster.rds_cluster_master_username
  sensitive   = true
}

output "rds_cluster_hosted_zone_id" {
  description = "The Route53 Hosted Zone ID of the endpoint"
  value       = module.rds_cluster.rds_cluster_hosted_zone_id
}

output "rds_cluster_parameter_group_id" {
  description = "The rds cluster parameter group id"
  value       = module.rds_cluster.rds_cluster_parameter_group_id
}

output "rds_cluster_parameter_group_arn" {
  description = "The ARN of the rds cluster parameter group"
  value       = module.rds_cluster.rds_cluster_parameter_group_arn
}

output "rds_cluster_cloudwatch_log_groups" {
  description = "Map of CloudWatch log groups created and their attributes"
  value       = module.rds_cluster.rds_cluster_cloudwatch_log_groups
}

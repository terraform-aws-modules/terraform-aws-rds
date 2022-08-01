# Multi-AZ RDS cluster example for PostgreSQL

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.6 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rds_cluster"></a> [rds\_cluster](#module\_rds\_cluster) | ../../ | n/a |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | terraform-aws-modules/security-group/aws | ~> 4.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 3.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rds_cluster_arn"></a> [rds\_cluster\_arn](#output\_rds\_cluster\_arn) | Amazon Resource Name (ARN) of cluster |
| <a name="output_rds_cluster_cloudwatch_log_groups"></a> [rds\_cluster\_cloudwatch\_log\_groups](#output\_rds\_cluster\_cloudwatch\_log\_groups) | Map of CloudWatch log groups created and their attributes |
| <a name="output_rds_cluster_database_name"></a> [rds\_cluster\_database\_name](#output\_rds\_cluster\_database\_name) | Name for an automatically created database on cluster creation |
| <a name="output_rds_cluster_endpoint"></a> [rds\_cluster\_endpoint](#output\_rds\_cluster\_endpoint) | Writer endpoint for the cluster |
| <a name="output_rds_cluster_engine_version_actual"></a> [rds\_cluster\_engine\_version\_actual](#output\_rds\_cluster\_engine\_version\_actual) | The running version of the cluster database |
| <a name="output_rds_cluster_hosted_zone_id"></a> [rds\_cluster\_hosted\_zone\_id](#output\_rds\_cluster\_hosted\_zone\_id) | The Route53 Hosted Zone ID of the endpoint |
| <a name="output_rds_cluster_id"></a> [rds\_cluster\_id](#output\_rds\_cluster\_id) | The RDS Cluster Identifier |
| <a name="output_rds_cluster_master_password"></a> [rds\_cluster\_master\_password](#output\_rds\_cluster\_master\_password) | The database master password |
| <a name="output_rds_cluster_master_username"></a> [rds\_cluster\_master\_username](#output\_rds\_cluster\_master\_username) | The database master username |
| <a name="output_rds_cluster_members"></a> [rds\_cluster\_members](#output\_rds\_cluster\_members) | List of RDS Instances that are a part of this cluster |
| <a name="output_rds_cluster_parameter_group_arn"></a> [rds\_cluster\_parameter\_group\_arn](#output\_rds\_cluster\_parameter\_group\_arn) | The ARN of the rds cluster parameter group |
| <a name="output_rds_cluster_parameter_group_id"></a> [rds\_cluster\_parameter\_group\_id](#output\_rds\_cluster\_parameter\_group\_id) | The rds cluster parameter group id |
| <a name="output_rds_cluster_port"></a> [rds\_cluster\_port](#output\_rds\_cluster\_port) | The database port |
| <a name="output_rds_cluster_reader_endpoint"></a> [rds\_cluster\_reader\_endpoint](#output\_rds\_cluster\_reader\_endpoint) | A read-only endpoint for the cluster, automatically load-balanced across replicas |
| <a name="output_rds_cluster_resource_id"></a> [rds\_cluster\_resource\_id](#output\_rds\_cluster\_resource\_id) | The RDS Cluster Resource ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

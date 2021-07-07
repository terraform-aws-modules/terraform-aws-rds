# Master and Replica RDS example for PostgreSQL

Configuration in this directory creates set of RDS resources demonstrating master and replica in the same VPC.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.49 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_master"></a> [master](#module\_master) | ../../ |  |
| <a name="module_replica"></a> [replica](#module\_replica) | ../../ |  |
| <a name="module_security_group_region1"></a> [security\_group\_region1](#module\_security\_group\_region1) | terraform-aws-modules/security-group/aws | ~> 4 |
| <a name="module_security_group_region2"></a> [security\_group\_region2](#module\_security\_group\_region2) | terraform-aws-modules/security-group/aws | ~> 4 |
| <a name="module_vpc_region1"></a> [vpc\_region1](#module\_vpc\_region1) | terraform-aws-modules/vpc/aws | ~> 2.0 |
| <a name="module_vpc_region2"></a> [vpc\_region2](#module\_vpc\_region2) | terraform-aws-modules/vpc/aws | ~> 2.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_master_db_instance_address"></a> [master\_db\_instance\_address](#output\_master\_db\_instance\_address) | The address of the RDS instance |
| <a name="output_master_db_instance_arn"></a> [master\_db\_instance\_arn](#output\_master\_db\_instance\_arn) | The ARN of the RDS instance |
| <a name="output_master_db_instance_availability_zone"></a> [master\_db\_instance\_availability\_zone](#output\_master\_db\_instance\_availability\_zone) | The availability zone of the RDS instance |
| <a name="output_master_db_instance_endpoint"></a> [master\_db\_instance\_endpoint](#output\_master\_db\_instance\_endpoint) | The connection endpoint |
| <a name="output_master_db_instance_hosted_zone_id"></a> [master\_db\_instance\_hosted\_zone\_id](#output\_master\_db\_instance\_hosted\_zone\_id) | The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record) |
| <a name="output_master_db_instance_id"></a> [master\_db\_instance\_id](#output\_master\_db\_instance\_id) | The RDS instance ID |
| <a name="output_master_db_instance_name"></a> [master\_db\_instance\_name](#output\_master\_db\_instance\_name) | The database name |
| <a name="output_master_db_instance_password"></a> [master\_db\_instance\_password](#output\_master\_db\_instance\_password) | The database password (this password may be old, because Terraform doesn't track it after initial creation) |
| <a name="output_master_db_instance_port"></a> [master\_db\_instance\_port](#output\_master\_db\_instance\_port) | The database port |
| <a name="output_master_db_instance_resource_id"></a> [master\_db\_instance\_resource\_id](#output\_master\_db\_instance\_resource\_id) | The RDS Resource ID of this instance |
| <a name="output_master_db_instance_status"></a> [master\_db\_instance\_status](#output\_master\_db\_instance\_status) | The RDS instance status |
| <a name="output_master_db_instance_username"></a> [master\_db\_instance\_username](#output\_master\_db\_instance\_username) | The master username for the database |
| <a name="output_master_db_subnet_group_arn"></a> [master\_db\_subnet\_group\_arn](#output\_master\_db\_subnet\_group\_arn) | The ARN of the db subnet group |
| <a name="output_master_db_subnet_group_id"></a> [master\_db\_subnet\_group\_id](#output\_master\_db\_subnet\_group\_id) | The db subnet group name |
| <a name="output_replica_db_instance_address"></a> [replica\_db\_instance\_address](#output\_replica\_db\_instance\_address) | The address of the RDS instance |
| <a name="output_replica_db_instance_arn"></a> [replica\_db\_instance\_arn](#output\_replica\_db\_instance\_arn) | The ARN of the RDS instance |
| <a name="output_replica_db_instance_availability_zone"></a> [replica\_db\_instance\_availability\_zone](#output\_replica\_db\_instance\_availability\_zone) | The availability zone of the RDS instance |
| <a name="output_replica_db_instance_endpoint"></a> [replica\_db\_instance\_endpoint](#output\_replica\_db\_instance\_endpoint) | The connection endpoint |
| <a name="output_replica_db_instance_hosted_zone_id"></a> [replica\_db\_instance\_hosted\_zone\_id](#output\_replica\_db\_instance\_hosted\_zone\_id) | The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record) |
| <a name="output_replica_db_instance_id"></a> [replica\_db\_instance\_id](#output\_replica\_db\_instance\_id) | The RDS instance ID |
| <a name="output_replica_db_instance_name"></a> [replica\_db\_instance\_name](#output\_replica\_db\_instance\_name) | The database name |
| <a name="output_replica_db_instance_port"></a> [replica\_db\_instance\_port](#output\_replica\_db\_instance\_port) | The database port |
| <a name="output_replica_db_instance_resource_id"></a> [replica\_db\_instance\_resource\_id](#output\_replica\_db\_instance\_resource\_id) | The RDS Resource ID of this instance |
| <a name="output_replica_db_instance_status"></a> [replica\_db\_instance\_status](#output\_replica\_db\_instance\_status) | The RDS instance status |
| <a name="output_replica_db_instance_username"></a> [replica\_db\_instance\_username](#output\_replica\_db\_instance\_username) | The replica username for the database |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

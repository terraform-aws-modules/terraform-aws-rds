# Complete RDS example for PostgreSQL

Configuration in this directory creates a set of RDS resources including DB instance, DB subnet group and DB parameter group.

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
| <a name="module_db"></a> [db](#module\_db) | ../../ |  |
| <a name="module_db_default"></a> [db\_default](#module\_db\_default) | ../../ |  |
| <a name="module_db_disabled"></a> [db\_disabled](#module\_db\_disabled) | ../../ |  |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | terraform-aws-modules/security-group/aws | ~> 4 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 2 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_default_instance_address"></a> [db\_default\_instance\_address](#output\_db\_default\_instance\_address) | The address of the RDS instance |
| <a name="output_db_default_instance_arn"></a> [db\_default\_instance\_arn](#output\_db\_default\_instance\_arn) | The ARN of the RDS instance |
| <a name="output_db_default_instance_availability_zone"></a> [db\_default\_instance\_availability\_zone](#output\_db\_default\_instance\_availability\_zone) | The availability zone of the RDS instance |
| <a name="output_db_default_instance_endpoint"></a> [db\_default\_instance\_endpoint](#output\_db\_default\_instance\_endpoint) | The connection endpoint |
| <a name="output_db_default_instance_hosted_zone_id"></a> [db\_default\_instance\_hosted\_zone\_id](#output\_db\_default\_instance\_hosted\_zone\_id) | The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record) |
| <a name="output_db_default_instance_id"></a> [db\_default\_instance\_id](#output\_db\_default\_instance\_id) | The RDS instance ID |
| <a name="output_db_default_instance_name"></a> [db\_default\_instance\_name](#output\_db\_default\_instance\_name) | The database name |
| <a name="output_db_default_instance_password"></a> [db\_default\_instance\_password](#output\_db\_default\_instance\_password) | The database password (this password may be old, because Terraform doesn't track it after initial creation) |
| <a name="output_db_default_instance_port"></a> [db\_default\_instance\_port](#output\_db\_default\_instance\_port) | The database port |
| <a name="output_db_default_instance_resource_id"></a> [db\_default\_instance\_resource\_id](#output\_db\_default\_instance\_resource\_id) | The RDS Resource ID of this instance |
| <a name="output_db_default_instance_status"></a> [db\_default\_instance\_status](#output\_db\_default\_instance\_status) | The RDS instance status |
| <a name="output_db_default_instance_username"></a> [db\_default\_instance\_username](#output\_db\_default\_instance\_username) | The master username for the database |
| <a name="output_db_default_parameter_group_arn"></a> [db\_default\_parameter\_group\_arn](#output\_db\_default\_parameter\_group\_arn) | The ARN of the db parameter group |
| <a name="output_db_default_parameter_group_id"></a> [db\_default\_parameter\_group\_id](#output\_db\_default\_parameter\_group\_id) | The db parameter group id |
| <a name="output_db_default_subnet_group_arn"></a> [db\_default\_subnet\_group\_arn](#output\_db\_default\_subnet\_group\_arn) | The ARN of the db subnet group |
| <a name="output_db_default_subnet_group_id"></a> [db\_default\_subnet\_group\_id](#output\_db\_default\_subnet\_group\_id) | The db subnet group name |
| <a name="output_db_enhanced_monitoring_iam_role_arn"></a> [db\_enhanced\_monitoring\_iam\_role\_arn](#output\_db\_enhanced\_monitoring\_iam\_role\_arn) | The Amazon Resource Name (ARN) specifying the monitoring role |
| <a name="output_db_instance_address"></a> [db\_instance\_address](#output\_db\_instance\_address) | The address of the RDS instance |
| <a name="output_db_instance_arn"></a> [db\_instance\_arn](#output\_db\_instance\_arn) | The ARN of the RDS instance |
| <a name="output_db_instance_availability_zone"></a> [db\_instance\_availability\_zone](#output\_db\_instance\_availability\_zone) | The availability zone of the RDS instance |
| <a name="output_db_instance_endpoint"></a> [db\_instance\_endpoint](#output\_db\_instance\_endpoint) | The connection endpoint |
| <a name="output_db_instance_hosted_zone_id"></a> [db\_instance\_hosted\_zone\_id](#output\_db\_instance\_hosted\_zone\_id) | The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record) |
| <a name="output_db_instance_id"></a> [db\_instance\_id](#output\_db\_instance\_id) | The RDS instance ID |
| <a name="output_db_instance_name"></a> [db\_instance\_name](#output\_db\_instance\_name) | The database name |
| <a name="output_db_instance_password"></a> [db\_instance\_password](#output\_db\_instance\_password) | The database password (this password may be old, because Terraform doesn't track it after initial creation) |
| <a name="output_db_instance_port"></a> [db\_instance\_port](#output\_db\_instance\_port) | The database port |
| <a name="output_db_instance_resource_id"></a> [db\_instance\_resource\_id](#output\_db\_instance\_resource\_id) | The RDS Resource ID of this instance |
| <a name="output_db_instance_status"></a> [db\_instance\_status](#output\_db\_instance\_status) | The RDS instance status |
| <a name="output_db_instance_username"></a> [db\_instance\_username](#output\_db\_instance\_username) | The master username for the database |
| <a name="output_db_parameter_group_arn"></a> [db\_parameter\_group\_arn](#output\_db\_parameter\_group\_arn) | The ARN of the db parameter group |
| <a name="output_db_parameter_group_id"></a> [db\_parameter\_group\_id](#output\_db\_parameter\_group\_id) | The db parameter group id |
| <a name="output_db_subnet_group_arn"></a> [db\_subnet\_group\_arn](#output\_db\_subnet\_group\_arn) | The ARN of the db subnet group |
| <a name="output_db_subnet_group_id"></a> [db\_subnet\_group\_id](#output\_db\_subnet\_group\_id) | The db subnet group name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

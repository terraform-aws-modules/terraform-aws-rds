# Enhanced Monitoring example

Configuration in this directory creates the additional resources required to use Enhanced Monitoring.

See http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html for details.

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

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.49 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_db"></a> [db](#module\_db) | ../../ |  |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | terraform-aws-modules/security-group/aws | ~> 3 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 2 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.rds_enhanced_monitoring](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.rds_enhanced_monitoring](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.rds_enhanced_monitoring](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this_db_instance_address"></a> [this\_db\_instance\_address](#output\_this\_db\_instance\_address) | The address of the RDS instance |
| <a name="output_this_db_instance_arn"></a> [this\_db\_instance\_arn](#output\_this\_db\_instance\_arn) | The ARN of the RDS instance |
| <a name="output_this_db_instance_availability_zone"></a> [this\_db\_instance\_availability\_zone](#output\_this\_db\_instance\_availability\_zone) | The availability zone of the RDS instance |
| <a name="output_this_db_instance_endpoint"></a> [this\_db\_instance\_endpoint](#output\_this\_db\_instance\_endpoint) | The connection endpoint |
| <a name="output_this_db_instance_hosted_zone_id"></a> [this\_db\_instance\_hosted\_zone\_id](#output\_this\_db\_instance\_hosted\_zone\_id) | The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record) |
| <a name="output_this_db_instance_id"></a> [this\_db\_instance\_id](#output\_this\_db\_instance\_id) | The RDS instance ID |
| <a name="output_this_db_instance_name"></a> [this\_db\_instance\_name](#output\_this\_db\_instance\_name) | The database name |
| <a name="output_this_db_instance_password"></a> [this\_db\_instance\_password](#output\_this\_db\_instance\_password) | The database password (this password may be old, because Terraform doesn't track it after initial creation) |
| <a name="output_this_db_instance_port"></a> [this\_db\_instance\_port](#output\_this\_db\_instance\_port) | The database port |
| <a name="output_this_db_instance_resource_id"></a> [this\_db\_instance\_resource\_id](#output\_this\_db\_instance\_resource\_id) | The RDS Resource ID of this instance |
| <a name="output_this_db_instance_status"></a> [this\_db\_instance\_status](#output\_this\_db\_instance\_status) | The RDS instance status |
| <a name="output_this_db_instance_username"></a> [this\_db\_instance\_username](#output\_this\_db\_instance\_username) | The master username for the database |
| <a name="output_this_db_parameter_group_arn"></a> [this\_db\_parameter\_group\_arn](#output\_this\_db\_parameter\_group\_arn) | The ARN of the db parameter group |
| <a name="output_this_db_parameter_group_id"></a> [this\_db\_parameter\_group\_id](#output\_this\_db\_parameter\_group\_id) | The db parameter group id |
| <a name="output_this_db_subnet_group_arn"></a> [this\_db\_subnet\_group\_arn](#output\_this\_db\_subnet\_group\_arn) | The ARN of the db subnet group |
| <a name="output_this_db_subnet_group_id"></a> [this\_db\_subnet\_group\_id](#output\_this\_db\_subnet\_group\_id) | The db subnet group name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

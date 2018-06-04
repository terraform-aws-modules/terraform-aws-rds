# Complete RDS example for MySQL

Configuration in this directory creates set of RDS resources including DB instance, DB subnet group and DB parameter group.

Data sources are used to discover existing VPC resources (VPC, subnet and security group).

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Outputs

| Name | Description |
|------|-------------|
| this_db_instance_address | The address of the RDS instance |
| this_db_instance_arn | The ARN of the RDS instance |
| this_db_instance_availability_zone | The availability zone of the RDS instance |
| this_db_instance_endpoint | The connection endpoint |
| this_db_instance_hosted_zone_id | The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record) |
| this_db_instance_id | The RDS instance ID |
| this_db_instance_name | The database name |
| this_db_instance_password | The database password (this password may be old, because Terraform doesn't track it after initial creation) |
| this_db_instance_port | The database port |
| this_db_instance_resource_id | The RDS Resource ID of this instance |
| this_db_instance_status | The RDS instance status |
| this_db_instance_username | The master username for the database |
| this_db_parameter_group_arn | The ARN of the db parameter group |
| this_db_parameter_group_id | The db parameter group id |
| this_db_subnet_group_arn | The ARN of the db subnet group |
| this_db_subnet_group_id | The db subnet group name |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

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
| terraform | >= 0.12.26 |
| aws | >= 2.49 |

## Providers

No provider.

## Modules

| Name | Source | Version |
|------|--------|---------|
| db | ../../ |  |
| db_default | ../../ |  |
| security_group | terraform-aws-modules/security-group/aws | ~> 3 |
| vpc | terraform-aws-modules/vpc/aws | ~> 2 |

## Resources

No resources.

## Inputs

No input.

## Outputs

| Name | Description |
|------|-------------|
| db\_default\_instance\_address | The address of the RDS instance |
| db\_default\_instance\_arn | The ARN of the RDS instance |
| db\_default\_instance\_availability\_zone | The availability zone of the RDS instance |
| db\_default\_instance\_endpoint | The connection endpoint |
| db\_default\_instance\_hosted\_zone\_id | The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record) |
| db\_default\_instance\_id | The RDS instance ID |
| db\_default\_instance\_name | The database name |
| db\_default\_instance\_password | The database password (this password may be old, because Terraform doesn't track it after initial creation) |
| db\_default\_instance\_port | The database port |
| db\_default\_instance\_resource\_id | The RDS Resource ID of this instance |
| db\_default\_instance\_status | The RDS instance status |
| db\_default\_instance\_username | The master username for the database |
| db\_default\_parameter\_group\_arn | The ARN of the db parameter group |
| db\_default\_parameter\_group\_id | The db parameter group id |
| db\_default\_subnet\_group\_arn | The ARN of the db subnet group |
| db\_default\_subnet\_group\_id | The db subnet group name |
| db\_random\_password\_instance\_address | The address of the RDS instance |
| db\_random\_password\_instance\_arn | The ARN of the RDS instance |
| db\_random\_password\_instance\_availability\_zone | The availability zone of the RDS instance |
| db\_random\_password\_instance\_endpoint | The connection endpoint |
| db\_random\_password\_instance\_hosted\_zone\_id | The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record) |
| db\_random\_password\_instance\_id | The RDS instance ID |
| db\_random\_password\_instance\_name | The database name |
| db\_random\_password\_instance\_password | The database password (this password may be old, because Terraform doesn't track it after initial creation) |
| db\_random\_password\_instance\_port | The database port |
| db\_random\_password\_instance\_resource\_id | The RDS Resource ID of this instance |
| db\_random\_password\_instance\_status | The RDS instance status |
| db\_random\_password\_instance\_username | The master username for the database |
| db\_random\_password\_parameter\_group\_arn | The ARN of the db parameter group |
| db\_random\_password\_parameter\_group\_id | The db parameter group id |
| db\_random\_password\_subnet\_group\_arn | The ARN of the db subnet group |
| db\_random\_password\_subnet\_group\_id | The db subnet group name |
| this\_db\_instance\_address | The address of the RDS instance |
| this\_db\_instance\_arn | The ARN of the RDS instance |
| this\_db\_instance\_availability\_zone | The availability zone of the RDS instance |
| this\_db\_instance\_endpoint | The connection endpoint |
| this\_db\_instance\_hosted\_zone\_id | The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record) |
| this\_db\_instance\_id | The RDS instance ID |
| this\_db\_instance\_name | The database name |
| this\_db\_instance\_password | The database password (this password may be old, because Terraform doesn't track it after initial creation) |
| this\_db\_instance\_port | The database port |
| this\_db\_instance\_resource\_id | The RDS Resource ID of this instance |
| this\_db\_instance\_status | The RDS instance status |
| this\_db\_instance\_username | The master username for the database |
| this\_db\_parameter\_group\_arn | The ARN of the db parameter group |
| this\_db\_parameter\_group\_id | The db parameter group id |
| this\_db\_subnet\_group\_arn | The ARN of the db subnet group |
| this\_db\_subnet\_group\_id | The db subnet group name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

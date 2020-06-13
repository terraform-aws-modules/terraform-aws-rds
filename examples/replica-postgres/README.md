# Master and Replica RDS example for PostgreSQL

Configuration in this directory creates set of RDS resources demonstrating master and replica in the same VPC.

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
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

No input.

## Outputs

| Name | Description |
|------|-------------|
| master\_db\_instance\_address | The address of the RDS instance |
| master\_db\_instance\_arn | The ARN of the RDS instance |
| master\_db\_instance\_availability\_zone | The availability zone of the RDS instance |
| master\_db\_instance\_endpoint | The connection endpoint |
| master\_db\_instance\_hosted\_zone\_id | The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record) |
| master\_db\_instance\_id | The RDS instance ID |
| master\_db\_instance\_name | The database name |
| master\_db\_instance\_password | The database password (this password may be old, because Terraform doesn't track it after initial creation) |
| master\_db\_instance\_port | The database port |
| master\_db\_instance\_resource\_id | The RDS Resource ID of this instance |
| master\_db\_instance\_status | The RDS instance status |
| master\_db\_instance\_username | The master username for the database |
| master\_db\_subnet\_group\_arn | The ARN of the db subnet group |
| master\_db\_subnet\_group\_id | The db subnet group name |
| replica\_db\_instance\_address | The address of the RDS instance |
| replica\_db\_instance\_arn | The ARN of the RDS instance |
| replica\_db\_instance\_availability\_zone | The availability zone of the RDS instance |
| replica\_db\_instance\_endpoint | The connection endpoint |
| replica\_db\_instance\_hosted\_zone\_id | The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record) |
| replica\_db\_instance\_id | The RDS instance ID |
| replica\_db\_instance\_name | The database name |
| replica\_db\_instance\_port | The database port |
| replica\_db\_instance\_resource\_id | The RDS Resource ID of this instance |
| replica\_db\_instance\_status | The RDS instance status |
| replica\_db\_instance\_username | The replica username for the database |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

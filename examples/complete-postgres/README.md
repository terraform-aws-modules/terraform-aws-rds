# Complete RDS example for PostgreSQL

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
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| http | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_region | AWS Region to create this resource | `string` | `"eu-west-1"` | no |
| database\_name | Name of the database to be created | `string` | `"demodb"` | no |
| engine\_name | Name of the database engine | `string` | `"postgres"` | no |
| engine\_version | Version of the database to be launched | `string` | `"9.6.9"` | no |
| major\_engine\_version | MAJOR.MINOR version of the DB engine | `string` | `"9.6"` | no |
| name | Name of the database | `string` | `"terratest-example-postgres"` | no |
| password | Master password of the DB | `string` | `"YourPwdShouldBeLongAndSecure!"` | no |
| port | The port on which the DB accepts connections | `string` | `"5432"` | no |
| publicly\_accessible | Bool to control if instance is publicly accessible | `bool` | `true` | no |
| username | Master username of the DB | `string` | `"demouser"` | no |

## Outputs

| Name | Description |
|------|-------------|
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

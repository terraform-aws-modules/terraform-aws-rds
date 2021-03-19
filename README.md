# AWS RDS Terraform module

Terraform module which creates RDS resources on AWS.

These types of resources are supported:

- [DB Instance](https://www.terraform.io/docs/providers/aws/r/db_instance.html)
- [DB Subnet Group](https://www.terraform.io/docs/providers/aws/r/db_subnet_group.html)
- [DB Parameter Group](https://www.terraform.io/docs/providers/aws/r/db_parameter_group.html)
- [DB Option Group](https://www.terraform.io/docs/providers/aws/r/db_option_group.html)

Root module calls these modules which can also be used separately to create independent resources:

- [db_instance](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/modules/db_instance) - creates RDS DB instance
- [db_subnet_group](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/modules/db_subnet_group) - creates RDS DB subnet group
- [db_parameter_group](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/modules/db_parameter_group) - creates RDS DB parameter group
- [db_option_group](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/modules/db_option_group) - creates RDS DB option group

## Usage

```hcl
module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 2.0"

  identifier = "demodb"

  engine            = "mysql"
  engine_version    = "5.7.19"
  instance_class    = "db.t2.large"
  allocated_storage = 5

  name     = "demodb"
  username = "user"
  password = "YourPwdShouldBeLongAndSecure!"
  port     = "3306"

  iam_database_authentication_enabled = true

  vpc_security_group_ids = ["sg-12345678"]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval = "30"
  monitoring_role_name = "MyRDSMonitoringRole"
  create_monitoring_role = true

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  # DB subnet group
  subnet_ids = ["subnet-12345678", "subnet-87654321"]

  # DB parameter group
  family = "mysql5.7"

  # DB option group
  major_engine_version = "5.7"

  # Database Deletion Protection
  deletion_protection = true

  parameters = [
    {
      name = "character_set_client"
      value = "utf8mb4"
    },
    {
      name = "character_set_server"
      value = "utf8mb4"
    }
  ]

  options = [
    {
      option_name = "MARIADB_AUDIT_PLUGIN"

      option_settings = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "CONNECT"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "37"
        },
      ]
    },
  ]
}
```

## Conditional creation

The following values are provided to toggle on/off creation of the associated resources as desired:

```hcl
module "db" {
  source = "terraform-aws-modules/rds/aws"

  # Disable creation of RDS instance(s)
  create_db_instance = false

  # Disable creation of option group - provide an option group or default AWS default
  create_db_option_group = false

  # Disable creation of parameter group - provide a parameter group or default to AWS default
  create_db_parameter_group = false

  # Disable creation of subnet group - provide a subnet group
  create_db_subnet_group = false

  # Enable creation of monitoring IAM role
  create_monitoring_role = true

  # ... omitted
}
```

## Option Groups

[Reference](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithOptionGroups.html)

Users have the ability to:

- Create an option group with the name provided:

```hcl
  option_group_name            = "prod-instance-mysql-8.0"
  option_group_use_name_prefix = false
```

- Create an option group using a unique prefix beginning with the name provided:

```hcl
  option_group_name = "prod-instance-mysql-8.0"
```

- Pass the name of an option group to use that has been created outside of the module:

```hcl
  create_option_group = false
  option_group_name   = "prod-instance-mysql-8.0" # must already exist in AWS
```

- Skip creating an option group for PostgreSQL entirely as that is not supported

```hcl
  engine            = "postgres"
  option_group_name = "prod-instance-postgresql-11.0" # this will be ignored, no option group created
```

- Use a default option group provided by AWS

```hcl
  create_option_group = false
```

## Parameter Groups

[Reference](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithParamGroups.html)

Users have the ability to:

- Create a parameter group with the name provided:

```hcl
  parameter_group_name            = "prod-instance-mysql-8.0"
  parameter_group_use_name_prefix = false
```

- Create a parameter group using a unique prefix beginning with the name provided:

```hcl
  parameter_group_name = "prod-instance-mysql-8.0"
```

- Pass the name of a parameter group to use that has been created outside of the module:

```hcl
  create_parameter_group = false
  parameter_group_name   = "prod-instance-mysql-8.0" # must already exist in AWS
```

- Use a default parameter group provided by AWS

```hcl
  create_parameter_group = false
```

## Examples

- [Complete RDS example for MSSQL](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/examples/complete-mssql)
- [Complete RDS example for MySQL](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/examples/complete-mysql)
- [Complete RDS example for Oracle](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/examples/complete-oracle)
- [Complete RDS example for PostgreSQL](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/examples/complete-postgres)
- [Enhanced monitoring example](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/examples/enhanced-monitoring)
- [Replica RDS example for MySQL](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/examples/replica-mysql)
- [Replica RDS example for PostgreSQL](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/examples/replica-postgres)
- [S3 import example for MySQL](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/examples/s3-import-mysql)

## Notes

1. This module does not create RDS security group. Use [terraform-aws-security-group](https://github.com/terraform-aws-modules/terraform-aws-security-group) module for this.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.26 |
| aws | >= 2.49 |
| random | >= 3.1 |

## Providers

| Name | Version |
|------|---------|
| random | >= 3.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allocated\_storage | The allocated storage in gigabytes | `string` | n/a | yes |
| allow\_major\_version\_upgrade | Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible | `bool` | `false` | no |
| apply\_immediately | Specifies whether any database modifications are applied immediately, or during the next maintenance window | `bool` | `false` | no |
| auto\_minor\_version\_upgrade | Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window | `bool` | `true` | no |
| availability\_zone | The Availability Zone of the RDS instance | `string` | `null` | no |
| backup\_retention\_period | The days to retain backups for | `number` | `null` | no |
| backup\_window | The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance\_window | `string` | n/a | yes |
| ca\_cert\_identifier | Specifies the identifier of the CA certificate for the DB instance | `string` | `null` | no |
| character\_set\_name | (Optional) The character set name to use for DB encoding in Oracle instances. This can't be changed. See Oracle Character Sets Supported in Amazon RDS and Collations and Character Sets for Microsoft SQL Server for more information. This can only be set on creation. | `string` | `null` | no |
| copy\_tags\_to\_snapshot | On delete, copy all Instance tags to the final snapshot (if final\_snapshot\_identifier is specified) | `bool` | `false` | no |
| create\_db\_instance | Whether to create a database instance | `bool` | `true` | no |
| create\_db\_option\_group | (Optional) Create a database option group | `bool` | `true` | no |
| create\_db\_parameter\_group | Whether to create a database parameter group | `bool` | `true` | no |
| create\_db\_subnet\_group | Whether to create a database subnet group | `bool` | `true` | no |
| create\_monitoring\_role | Create IAM role with a defined name that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. | `bool` | `false` | no |
| create\_random\_password | Whether to create random password for RDS primary cluster | `bool` | `false` | no |
| db\_subnet\_group\_description | Description of the DB subnet group to create | `string` | `""` | no |
| db\_subnet\_group\_name | Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC | `string` | `null` | no |
| db\_subnet\_group\_use\_name\_prefix | Determines whether to use `subnet_group_name` as is or create a unique name beginning with the `subnet_group_name` as the prefix | `bool` | `true` | no |
| delete\_automated\_backups | Specifies whether to remove automated backups immediately after the DB instance is deleted | `bool` | `true` | no |
| deletion\_protection | The database can't be deleted when this value is set to true. | `bool` | `false` | no |
| domain | The ID of the Directory Service Active Directory domain to create the instance in | `string` | `null` | no |
| domain\_iam\_role\_name | (Required if domain is provided) The name of the IAM role to be used when making API calls to the Directory Service | `string` | `null` | no |
| enabled\_cloudwatch\_logs\_exports | List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace, postgresql (PostgreSQL), upgrade (PostgreSQL). | `list(string)` | `[]` | no |
| engine | The database engine to use | `string` | n/a | yes |
| engine\_version | The engine version to use | `string` | n/a | yes |
| family | The family of the DB parameter group | `string` | `""` | no |
| final\_snapshot\_identifier | The name of your final DB snapshot when this DB instance is deleted. | `string` | `null` | no |
| final\_snapshot\_identifier\_prefix | The name which is prefixed to the final snapshot on cluster destroy | `string` | `"final"` | no |
| iam\_database\_authentication\_enabled | Specifies whether or not the mappings of AWS Identity and Access Management (IAM) accounts to database accounts are enabled | `bool` | `false` | no |
| identifier | The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier | `string` | n/a | yes |
| instance\_class | The instance type of the RDS instance | `string` | n/a | yes |
| iops | The amount of provisioned IOPS. Setting this implies a storage\_type of 'io1' | `number` | `0` | no |
| kms\_key\_id | The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN. If storage\_encrypted is set to true and kms\_key\_id is not specified the default KMS key created in your account will be used | `string` | `null` | no |
| license\_model | License model information for this DB instance. Optional, but required for some DB engines, i.e. Oracle SE1 | `string` | `null` | no |
| maintenance\_window | The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00' | `string` | n/a | yes |
| major\_engine\_version | Specifies the major version of the engine that this option group should be associated with | `string` | `""` | no |
| max\_allocated\_storage | Specifies the value for Storage Autoscaling | `number` | `0` | no |
| monitoring\_interval | The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60. | `number` | `0` | no |
| monitoring\_role\_arn | The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. Must be specified if monitoring\_interval is non-zero. | `string` | `null` | no |
| monitoring\_role\_name | Name of the IAM role which will be created when create\_monitoring\_role is enabled. | `string` | `"rds-monitoring-role"` | no |
| multi\_az | Specifies if the RDS instance is multi-AZ | `bool` | `false` | no |
| name | The DB name to create. If omitted, no database is created initially | `string` | `null` | no |
| option\_group\_description | The description of the option group | `string` | `""` | no |
| option\_group\_name | Name of the option group | `string` | `null` | no |
| option\_group\_timeouts | Define maximum timeout for deletion of `aws_db_option_group` resource | `map(string)` | <pre>{<br>  "delete": "15m"<br>}</pre> | no |
| option\_group\_use\_name\_prefix | Determines whether to use `option_group_name` as is or create a unique name beginning with the `option_group_name` as the prefix | `bool` | `true` | no |
| options | A list of Options to apply. | `any` | `[]` | no |
| parameter\_group\_description | Description of the DB parameter group to create | `string` | `""` | no |
| parameter\_group\_name | Name of the DB parameter group to associate or create | `string` | `null` | no |
| parameter\_group\_use\_name\_prefix | Determines whether to use `parameter_group_name` as is or create a unique name beginning with the `parameter_group_name` as the prefix | `bool` | `true` | no |
| parameters | A list of DB parameters (map) to apply | `list(map(string))` | `[]` | no |
| password | Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file | `string` | `""` | no |
| performance\_insights\_enabled | Specifies whether Performance Insights are enabled | `bool` | `false` | no |
| performance\_insights\_kms\_key\_id | The ARN for the KMS key to encrypt Performance Insights data. | `string` | `null` | no |
| performance\_insights\_retention\_period | The amount of time in days to retain Performance Insights data. Either 7 (7 days) or 731 (2 years). | `number` | `7` | no |
| port | The port on which the DB accepts connections | `string` | n/a | yes |
| publicly\_accessible | Bool to control if instance is publicly accessible | `bool` | `false` | no |
| random\_password\_length | (Optional) Length of random password to create. (default: 10) | `number` | `10` | no |
| replicate\_source\_db | Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate. | `string` | `null` | no |
| s3\_import | Restore from a Percona Xtrabackup in S3 (only MySQL is supported) | `map(string)` | `null` | no |
| skip\_final\_snapshot | Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final\_snapshot\_identifier | `bool` | `false` | no |
| snapshot\_identifier | Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console, e.g: rds:production-2015-06-26-06-05. | `string` | `null` | no |
| storage\_encrypted | Specifies whether the DB instance is encrypted | `bool` | `false` | no |
| storage\_type | One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'gp2' if not. | `string` | `null` | no |
| subnet\_ids | A list of VPC subnet IDs | `list(string)` | `[]` | no |
| tags | A mapping of tags to assign to all resources | `map(string)` | `{}` | no |
| timeouts | (Optional) Updated Terraform resource management timeouts. Applies to `aws_db_instance` in particular to permit resource management times | `map(string)` | <pre>{<br>  "create": "40m",<br>  "delete": "40m",<br>  "update": "80m"<br>}</pre> | no |
| timezone | (Optional) Time zone of the DB instance. timezone is currently only supported by Microsoft SQL Server. The timezone can only be set on creation. See MSSQL User Guide for more information. | `string` | `null` | no |
| username | Username for the master DB user | `string` | n/a | yes |
| vpc\_security\_group\_ids | List of VPC security groups to associate | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| enhanced\_monitoring\_iam\_role\_arn | The Amazon Resource Name (ARN) specifying the monitoring role |
| enhanced\_monitoring\_iam\_role\_name | The name of the monitoring role |
| this\_db\_instance\_address | The address of the RDS instance |
| this\_db\_instance\_arn | The ARN of the RDS instance |
| this\_db\_instance\_availability\_zone | The availability zone of the RDS instance |
| this\_db\_instance\_ca\_cert\_identifier | Specifies the identifier of the CA certificate for the DB instance |
| this\_db\_instance\_domain | The ID of the Directory Service Active Directory domain the instance is joined to |
| this\_db\_instance\_domain\_iam\_role\_name | The name of the IAM role to be used when making API calls to the Directory Service. |
| this\_db\_instance\_endpoint | The connection endpoint |
| this\_db\_instance\_hosted\_zone\_id | The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record) |
| this\_db\_instance\_id | The RDS instance ID |
| this\_db\_instance\_name | The database name |
| this\_db\_instance\_password | The database password (this password may be old, because Terraform doesn't track it after initial creation) |
| this\_db\_instance\_port | The database port |
| this\_db\_instance\_resource\_id | The RDS Resource ID of this instance |
| this\_db\_instance\_status | The RDS instance status |
| this\_db\_instance\_username | The master username for the database |
| this\_db\_master\_password | The master password |
| this\_db\_option\_group\_arn | The ARN of the db option group |
| this\_db\_option\_group\_id | The db option group id |
| this\_db\_parameter\_group\_arn | The ARN of the db parameter group |
| this\_db\_parameter\_group\_id | The db parameter group id |
| this\_db\_subnet\_group\_arn | The ARN of the db subnet group |
| this\_db\_subnet\_group\_id | The db subnet group name |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Currently maintained by [these awesome contributors](https://github.com/terraform-aws-modules/terraform-aws-rds/graphs/contributors).
Migrated from `terraform-community-modules/tf_aws_rds`, where it was maintained by [these awesome contributors](https://github.com/terraform-community-modules/tf_aws_rds/graphs/contributors).
Module managed by [Anton Babenko](https://github.com/antonbabenko).

## License

Apache 2 Licensed. See LICENSE for full details.

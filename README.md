# AWS RDS Terraform module

Terraform module which creates RDS resources on AWS.

Root module calls these modules which can also be used separately to create independent resources:

- [db_instance](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/modules/db_instance) - creates RDS DB instance
- [db_subnet_group](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/modules/db_subnet_group) - creates RDS DB subnet group
- [db_parameter_group](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/modules/db_parameter_group) - creates RDS DB parameter group
- [db_option_group](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/modules/db_option_group) - creates RDS DB option group

## Usage

```hcl
module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 3.0"

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
  create_db_option_group = false
  option_group_name      = "prod-instance-mysql-8.0" # must already exist in AWS
```

- Skip creating an option group for PostgreSQL entirely as that is not supported

```hcl
  engine            = "postgres"
  option_group_name = "prod-instance-postgresql-11.0" # this will be ignored, no option group created
```

- Use a default option group provided by AWS

```hcl
  create_db_option_group = false
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
  create_db_parameter_group = false
  parameter_group_name   = "prod-instance-mysql-8.0" # must already exist in AWS
```

- Use a default parameter group provided by AWS

```hcl
  create_db_parameter_group = false
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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.49 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_db_instance"></a> [db\_instance](#module\_db\_instance) | ./modules/db_instance |  |
| <a name="module_db_option_group"></a> [db\_option\_group](#module\_db\_option\_group) | ./modules/db_option_group |  |
| <a name="module_db_parameter_group"></a> [db\_parameter\_group](#module\_db\_parameter\_group) | ./modules/db_parameter_group |  |
| <a name="module_db_subnet_group"></a> [db\_subnet\_group](#module\_db\_subnet\_group) | ./modules/db_subnet_group |  |

## Resources

| Name | Type |
|------|------|
| [random_password.master_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | The allocated storage in gigabytes | `string` | `null` | no |
| <a name="input_allow_major_version_upgrade"></a> [allow\_major\_version\_upgrade](#input\_allow\_major\_version\_upgrade) | Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible | `bool` | `false` | no |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Specifies whether any database modifications are applied immediately, or during the next maintenance window | `bool` | `false` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window | `bool` | `true` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | The Availability Zone of the RDS instance | `string` | `null` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | The days to retain backups for | `number` | `null` | no |
| <a name="input_backup_window"></a> [backup\_window](#input\_backup\_window) | The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance\_window | `string` | `null` | no |
| <a name="input_ca_cert_identifier"></a> [ca\_cert\_identifier](#input\_ca\_cert\_identifier) | Specifies the identifier of the CA certificate for the DB instance | `string` | `null` | no |
| <a name="input_character_set_name"></a> [character\_set\_name](#input\_character\_set\_name) | (Optional) The character set name to use for DB encoding in Oracle instances. This can't be changed. See Oracle Character Sets Supported in Amazon RDS and Collations and Character Sets for Microsoft SQL Server for more information. This can only be set on creation. | `string` | `null` | no |
| <a name="input_copy_tags_to_snapshot"></a> [copy\_tags\_to\_snapshot](#input\_copy\_tags\_to\_snapshot) | On delete, copy all Instance tags to the final snapshot (if final\_snapshot\_identifier is specified) | `bool` | `false` | no |
| <a name="input_create_db_instance"></a> [create\_db\_instance](#input\_create\_db\_instance) | Whether to create a database instance | `bool` | `true` | no |
| <a name="input_create_db_option_group"></a> [create\_db\_option\_group](#input\_create\_db\_option\_group) | (Optional) Create a database option group | `bool` | `true` | no |
| <a name="input_create_db_parameter_group"></a> [create\_db\_parameter\_group](#input\_create\_db\_parameter\_group) | Whether to create a database parameter group | `bool` | `true` | no |
| <a name="input_create_db_subnet_group"></a> [create\_db\_subnet\_group](#input\_create\_db\_subnet\_group) | Whether to create a database subnet group | `bool` | `true` | no |
| <a name="input_create_monitoring_role"></a> [create\_monitoring\_role](#input\_create\_monitoring\_role) | Create IAM role with a defined name that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. | `bool` | `false` | no |
| <a name="input_create_random_password"></a> [create\_random\_password](#input\_create\_random\_password) | Whether to create random password for RDS primary cluster | `bool` | `false` | no |
| <a name="input_cross_region_replica"></a> [cross\_region\_replica](#input\_cross\_region\_replica) | Specifies if the replica should be cross region. It allows the use of a subnet group in a region different than the master instance | `bool` | `false` | no |
| <a name="input_db_instance_tags"></a> [db\_instance\_tags](#input\_db\_instance\_tags) | Additional tags for the DB instance | `map(string)` | `{}` | no |
| <a name="input_db_option_group_tags"></a> [db\_option\_group\_tags](#input\_db\_option\_group\_tags) | Additional tags for the DB option group | `map(string)` | `{}` | no |
| <a name="input_db_parameter_group_tags"></a> [db\_parameter\_group\_tags](#input\_db\_parameter\_group\_tags) | Additional tags for the  DB parameter group | `map(string)` | `{}` | no |
| <a name="input_db_subnet_group_description"></a> [db\_subnet\_group\_description](#input\_db\_subnet\_group\_description) | Description of the DB subnet group to create | `string` | `""` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC | `string` | `null` | no |
| <a name="input_db_subnet_group_tags"></a> [db\_subnet\_group\_tags](#input\_db\_subnet\_group\_tags) | Additional tags for the DB subnet group | `map(string)` | `{}` | no |
| <a name="input_db_subnet_group_use_name_prefix"></a> [db\_subnet\_group\_use\_name\_prefix](#input\_db\_subnet\_group\_use\_name\_prefix) | Determines whether to use `subnet_group_name` as is or create a unique name beginning with the `subnet_group_name` as the prefix | `bool` | `true` | no |
| <a name="input_delete_automated_backups"></a> [delete\_automated\_backups](#input\_delete\_automated\_backups) | Specifies whether to remove automated backups immediately after the DB instance is deleted | `bool` | `true` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | The database can't be deleted when this value is set to true. | `bool` | `false` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | The ID of the Directory Service Active Directory domain to create the instance in | `string` | `null` | no |
| <a name="input_domain_iam_role_name"></a> [domain\_iam\_role\_name](#input\_domain\_iam\_role\_name) | (Required if domain is provided) The name of the IAM role to be used when making API calls to the Directory Service | `string` | `null` | no |
| <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports) | List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace, postgresql (PostgreSQL), upgrade (PostgreSQL). | `list(string)` | `[]` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | The database engine to use | `string` | `""` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The engine version to use | `string` | `null` | no |
| <a name="input_family"></a> [family](#input\_family) | The family of the DB parameter group | `string` | `""` | no |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier) | The name of your final DB snapshot when this DB instance is deleted. | `string` | `null` | no |
| <a name="input_final_snapshot_identifier_prefix"></a> [final\_snapshot\_identifier\_prefix](#input\_final\_snapshot\_identifier\_prefix) | The name which is prefixed to the final snapshot on cluster destroy | `string` | `"final"` | no |
| <a name="input_iam_database_authentication_enabled"></a> [iam\_database\_authentication\_enabled](#input\_iam\_database\_authentication\_enabled) | Specifies whether or not the mappings of AWS Identity and Access Management (IAM) accounts to database accounts are enabled | `bool` | `false` | no |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier | `string` | n/a | yes |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | The instance type of the RDS instance | `string` | `null` | no |
| <a name="input_iops"></a> [iops](#input\_iops) | The amount of provisioned IOPS. Setting this implies a storage\_type of 'io1' | `number` | `0` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN. If storage\_encrypted is set to true and kms\_key\_id is not specified the default KMS key created in your account will be used | `string` | `null` | no |
| <a name="input_license_model"></a> [license\_model](#input\_license\_model) | License model information for this DB instance. Optional, but required for some DB engines, i.e. Oracle SE1 | `string` | `null` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00' | `string` | `null` | no |
| <a name="input_major_engine_version"></a> [major\_engine\_version](#input\_major\_engine\_version) | Specifies the major version of the engine that this option group should be associated with | `string` | `""` | no |
| <a name="input_max_allocated_storage"></a> [max\_allocated\_storage](#input\_max\_allocated\_storage) | Specifies the value for Storage Autoscaling | `number` | `0` | no |
| <a name="input_monitoring_interval"></a> [monitoring\_interval](#input\_monitoring\_interval) | The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60. | `number` | `0` | no |
| <a name="input_monitoring_role_arn"></a> [monitoring\_role\_arn](#input\_monitoring\_role\_arn) | The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. Must be specified if monitoring\_interval is non-zero. | `string` | `null` | no |
| <a name="input_monitoring_role_description"></a> [monitoring\_role\_description](#input\_monitoring\_role\_description) | Description of the monitoring IAM role | `string` | `null` | no |
| <a name="input_monitoring_role_name"></a> [monitoring\_role\_name](#input\_monitoring\_role\_name) | Name of the IAM role which will be created when create\_monitoring\_role is enabled. | `string` | `"rds-monitoring-role"` | no |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | Specifies if the RDS instance is multi-AZ | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | The DB name to create. If omitted, no database is created initially | `string` | `null` | no |
| <a name="input_option_group_description"></a> [option\_group\_description](#input\_option\_group\_description) | The description of the option group | `string` | `""` | no |
| <a name="input_option_group_name"></a> [option\_group\_name](#input\_option\_group\_name) | Name of the option group | `string` | `null` | no |
| <a name="input_option_group_timeouts"></a> [option\_group\_timeouts](#input\_option\_group\_timeouts) | Define maximum timeout for deletion of `aws_db_option_group` resource | `map(string)` | <pre>{<br>  "delete": "15m"<br>}</pre> | no |
| <a name="input_option_group_use_name_prefix"></a> [option\_group\_use\_name\_prefix](#input\_option\_group\_use\_name\_prefix) | Determines whether to use `option_group_name` as is or create a unique name beginning with the `option_group_name` as the prefix | `bool` | `true` | no |
| <a name="input_options"></a> [options](#input\_options) | A list of Options to apply. | `any` | `[]` | no |
| <a name="input_parameter_group_description"></a> [parameter\_group\_description](#input\_parameter\_group\_description) | Description of the DB parameter group to create | `string` | `""` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | Name of the DB parameter group to associate or create | `string` | `null` | no |
| <a name="input_parameter_group_use_name_prefix"></a> [parameter\_group\_use\_name\_prefix](#input\_parameter\_group\_use\_name\_prefix) | Determines whether to use `parameter_group_name` as is or create a unique name beginning with the `parameter_group_name` as the prefix | `bool` | `true` | no |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | A list of DB parameters (map) to apply | `list(map(string))` | `[]` | no |
| <a name="input_password"></a> [password](#input\_password) | Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file | `string` | `""` | no |
| <a name="input_performance_insights_enabled"></a> [performance\_insights\_enabled](#input\_performance\_insights\_enabled) | Specifies whether Performance Insights are enabled | `bool` | `false` | no |
| <a name="input_performance_insights_kms_key_id"></a> [performance\_insights\_kms\_key\_id](#input\_performance\_insights\_kms\_key\_id) | The ARN for the KMS key to encrypt Performance Insights data. | `string` | `null` | no |
| <a name="input_performance_insights_retention_period"></a> [performance\_insights\_retention\_period](#input\_performance\_insights\_retention\_period) | The amount of time in days to retain Performance Insights data. Either 7 (7 days) or 731 (2 years). | `number` | `7` | no |
| <a name="input_port"></a> [port](#input\_port) | The port on which the DB accepts connections | `string` | `null` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | Bool to control if instance is publicly accessible | `bool` | `false` | no |
| <a name="input_random_password_length"></a> [random\_password\_length](#input\_random\_password\_length) | (Optional) Length of random password to create. (default: 10) | `number` | `10` | no |
| <a name="input_replicate_source_db"></a> [replicate\_source\_db](#input\_replicate\_source\_db) | Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate. | `string` | `null` | no |
| <a name="input_restore_to_point_in_time"></a> [restore\_to\_point\_in\_time](#input\_restore\_to\_point\_in\_time) | Restore to a point in time (MySQL is NOT supported) | `map(string)` | `null` | no |
| <a name="input_s3_import"></a> [s3\_import](#input\_s3\_import) | Restore from a Percona Xtrabackup in S3 (only MySQL is supported) | `map(string)` | `null` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final\_snapshot\_identifier | `bool` | `false` | no |
| <a name="input_snapshot_identifier"></a> [snapshot\_identifier](#input\_snapshot\_identifier) | Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console, e.g: rds:production-2015-06-26-06-05. | `string` | `null` | no |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | Specifies whether the DB instance is encrypted | `bool` | `false` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'gp2' if not. | `string` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A list of VPC subnet IDs | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to all resources | `map(string)` | `{}` | no |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | (Optional) Updated Terraform resource management timeouts. Applies to `aws_db_instance` in particular to permit resource management times | `map(string)` | <pre>{<br>  "create": "40m",<br>  "delete": "40m",<br>  "update": "80m"<br>}</pre> | no |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | (Optional) Time zone of the DB instance. timezone is currently only supported by Microsoft SQL Server. The timezone can only be set on creation. See MSSQL User Guide for more information. | `string` | `null` | no |
| <a name="input_username"></a> [username](#input\_username) | Username for the master DB user | `string` | `null` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | List of VPC security groups to associate | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_instance_address"></a> [db\_instance\_address](#output\_db\_instance\_address) | The address of the RDS instance |
| <a name="output_db_instance_arn"></a> [db\_instance\_arn](#output\_db\_instance\_arn) | The ARN of the RDS instance |
| <a name="output_db_instance_availability_zone"></a> [db\_instance\_availability\_zone](#output\_db\_instance\_availability\_zone) | The availability zone of the RDS instance |
| <a name="output_db_instance_ca_cert_identifier"></a> [db\_instance\_ca\_cert\_identifier](#output\_db\_instance\_ca\_cert\_identifier) | Specifies the identifier of the CA certificate for the DB instance |
| <a name="output_db_instance_domain"></a> [db\_instance\_domain](#output\_db\_instance\_domain) | The ID of the Directory Service Active Directory domain the instance is joined to |
| <a name="output_db_instance_domain_iam_role_name"></a> [db\_instance\_domain\_iam\_role\_name](#output\_db\_instance\_domain\_iam\_role\_name) | The name of the IAM role to be used when making API calls to the Directory Service. |
| <a name="output_db_instance_endpoint"></a> [db\_instance\_endpoint](#output\_db\_instance\_endpoint) | The connection endpoint |
| <a name="output_db_instance_hosted_zone_id"></a> [db\_instance\_hosted\_zone\_id](#output\_db\_instance\_hosted\_zone\_id) | The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record) |
| <a name="output_db_instance_id"></a> [db\_instance\_id](#output\_db\_instance\_id) | The RDS instance ID |
| <a name="output_db_instance_name"></a> [db\_instance\_name](#output\_db\_instance\_name) | The database name |
| <a name="output_db_instance_password"></a> [db\_instance\_password](#output\_db\_instance\_password) | The database password (this password may be old, because Terraform doesn't track it after initial creation) |
| <a name="output_db_instance_port"></a> [db\_instance\_port](#output\_db\_instance\_port) | The database port |
| <a name="output_db_instance_resource_id"></a> [db\_instance\_resource\_id](#output\_db\_instance\_resource\_id) | The RDS Resource ID of this instance |
| <a name="output_db_instance_status"></a> [db\_instance\_status](#output\_db\_instance\_status) | The RDS instance status |
| <a name="output_db_instance_username"></a> [db\_instance\_username](#output\_db\_instance\_username) | The master username for the database |
| <a name="output_db_master_password"></a> [db\_master\_password](#output\_db\_master\_password) | The master password |
| <a name="output_db_option_group_arn"></a> [db\_option\_group\_arn](#output\_db\_option\_group\_arn) | The ARN of the db option group |
| <a name="output_db_option_group_id"></a> [db\_option\_group\_id](#output\_db\_option\_group\_id) | The db option group id |
| <a name="output_db_parameter_group_arn"></a> [db\_parameter\_group\_arn](#output\_db\_parameter\_group\_arn) | The ARN of the db parameter group |
| <a name="output_db_parameter_group_id"></a> [db\_parameter\_group\_id](#output\_db\_parameter\_group\_id) | The db parameter group id |
| <a name="output_db_subnet_group_arn"></a> [db\_subnet\_group\_arn](#output\_db\_subnet\_group\_arn) | The ARN of the db subnet group |
| <a name="output_db_subnet_group_id"></a> [db\_subnet\_group\_id](#output\_db\_subnet\_group\_id) | The db subnet group name |
| <a name="output_enhanced_monitoring_iam_role_arn"></a> [enhanced\_monitoring\_iam\_role\_arn](#output\_enhanced\_monitoring\_iam\_role\_arn) | The Amazon Resource Name (ARN) specifying the monitoring role |
| <a name="output_enhanced_monitoring_iam_role_name"></a> [enhanced\_monitoring\_iam\_role\_name](#output\_enhanced\_monitoring\_iam\_role\_name) | The name of the monitoring role |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module is maintained by [Anton Babenko](https://github.com/antonbabenko) with help from [these awesome contributors](https://github.com/terraform-aws-modules/terraform-aws-rds/graphs/contributors).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/LICENSE) for full details.

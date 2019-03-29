# aws_db_instance

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| allocated\_storage | The allocated storage in gigabytes | string | n/a | yes |
| allow\_major\_version\_upgrade | Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible | string | `"false"` | no |
| apply\_immediately | Specifies whether any database modifications are applied immediately, or during the next maintenance window | string | `"false"` | no |
| auto\_minor\_version\_upgrade | Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window | string | `"true"` | no |
| availability\_zone | The Availability Zone of the RDS instance | string | `""` | no |
| backup\_retention\_period | The days to retain backups for | string | `"1"` | no |
| backup\_window | The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window | string | n/a | yes |
| character\_set\_name | (Optional) The character set name to use for DB encoding in Oracle instances. This can't be changed. See Oracle Character Sets Supported in Amazon RDS for more information | string | `""` | no |
| copy\_tags\_to\_snapshot | On delete, copy all Instance tags to the final snapshot (if final_snapshot_identifier is specified) | string | `"false"` | no |
| create | Whether to create this resource or not? | string | `"true"` | no |
| create\_monitoring\_role | Create IAM role with a defined name that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. | string | `"false"` | no |
| db\_subnet\_group\_name | Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC | string | `""` | no |
| deletion\_protection | The database can't be deleted when this value is set to true. | string | `"false"` | no |
| enabled\_cloudwatch\_logs\_exports | List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace, postgresql (PostgreSQL), upgrade (PostgreSQL). | list | `<list>` | no |
| engine | The database engine to use | string | n/a | yes |
| engine\_version | The engine version to use | string | n/a | yes |
| final\_snapshot\_identifier | The name of your final DB snapshot when this DB instance is deleted. | string | `"false"` | no |
| iam\_database\_authentication\_enabled | Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled | string | `"false"` | no |
| identifier | The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier | string | n/a | yes |
| instance\_class | The instance type of the RDS instance | string | n/a | yes |
| iops | The amount of provisioned IOPS. Setting this implies a storage_type of 'io1' | string | `"0"` | no |
| kms\_key\_id | The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN. If storage_encrypted is set to true and kms_key_id is not specified the default KMS key created in your account will be used | string | `""` | no |
| license\_model | License model information for this DB instance. Optional, but required for some DB engines, i.e. Oracle SE1 | string | `""` | no |
| maintenance\_window | The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00' | string | n/a | yes |
| monitoring\_interval | The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60. | string | `"0"` | no |
| monitoring\_role\_arn | The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. Must be specified if monitoring_interval is non-zero. | string | `""` | no |
| monitoring\_role\_name | Name of the IAM role which will be created when create_monitoring_role is enabled. | string | `"rds-monitoring-role"` | no |
| multi\_az | Specifies if the RDS instance is multi-AZ | string | `"false"` | no |
| name | The DB name to create. If omitted, no database is created initially | string | `""` | no |
| option\_group\_name | Name of the DB option group to associate. | string | `""` | no |
| parameter\_group\_name | Name of the DB parameter group to associate | string | `""` | no |
| password | Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file | string | n/a | yes |
| port | The port on which the DB accepts connections | string | n/a | yes |
| publicly\_accessible | Bool to control if instance is publicly accessible | string | `"false"` | no |
| replicate\_source\_db | Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate. | string | `""` | no |
| skip\_final\_snapshot | Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier | string | `"true"` | no |
| snapshot\_identifier | Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console, e.g: rds:production-2015-06-26-06-05. | string | `""` | no |
| storage\_encrypted | Specifies whether the DB instance is encrypted | string | `"false"` | no |
| storage\_type | One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'standard' if not. Note that this behaviour is different from the AWS web console, where the default is 'gp2'. | string | `"gp2"` | no |
| tags | A mapping of tags to assign to all resources | map | `<map>` | no |
| timeouts | (Optional) Updated Terraform resource management timeouts. Applies to `aws_db_instance` in particular to permit resource management times | map | `<map>` | no |
| timezone | (Optional) Time zone of the DB instance. timezone is currently only supported by Microsoft SQL Server. The timezone can only be set on creation. See MSSQL User Guide for more information. | string | `""` | no |
| username | Username for the master DB user | string | n/a | yes |
| vpc\_security\_group\_ids | List of VPC security groups to associate | list | `<list>` | no |

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
| this\_db\_instance\_port | The database port |
| this\_db\_instance\_resource\_id | The RDS Resource ID of this instance |
| this\_db\_instance\_status | The RDS instance status |
| this\_db\_instance\_username | The master username for the database |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

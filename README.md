# AWS RDS Terraform module

Terraform module which creates RDS resources on AWS.

These types of resources are supported:

* [DB Instance](https://www.terraform.io/docs/providers/aws/r/db_instance.html)
* [DB Subnet Group](https://www.terraform.io/docs/providers/aws/r/db_subnet_group.html)
* [DB Parameter Group](https://www.terraform.io/docs/providers/aws/r/db_parameter_group.html)
* [DB Option Group](https://www.terraform.io/docs/providers/aws/r/db_option_group.html)

Root module calls these modules which can also be used separately to create independent resources:

* [db_instance](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/modules/db_instance) - creates RDS DB instance
* [db_subnet_group](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/modules/db_subnet_group) - creates RDS DB subnet group
* [db_parameter_group](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/modules/db_parameter_group) - creates RDS DB parameter group
* [db_option_group](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/modules/db_option_group) - creates RDS DB option group

## Usage

```hcl
module "db" {
  source = "terraform-aws-modules/rds/aws"

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

  # Snapshot name upon DB deletion
  final_snapshot_identifier = "demodb"

  # Database Deletion Protection
  deletion_protection = true

  parameters = [
    {
      name = "character_set_client"
      value = "utf8"
    },
    {
      name = "character_set_server"
      value = "utf8"
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

There is also a way to specify an existing database subnet group and parameter group name instead of creating new resources like this:

```hcl
# This RDS instance will be created using default database subnet and parameter group
module "db" {
  source = "terraform-aws-modules/rds/aws"

  db_subnet_group_name = "default"
  parameter_group_name = "default.mysql5.7"

  # ... omitted
}
```

## Examples

* [Complete RDS example for MySQL](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/examples/complete-mysql)
* [Complete RDS example for PostgreSQL](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/examples/complete-postgres)
* [Complete RDS example for Oracle](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/examples/complete-oracle)
* [Complete RDS example for MSSQL](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/examples/complete-mssql)
* [Enhanced monitoring example](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/examples/enhanced-monitoring)

## Notes

1. This module does not create RDS security group. Use [terraform-aws-security-group](https://github.com/terraform-aws-modules/terraform-aws-security-group) module for this.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| allocated_storage | The allocated storage in gigabytes | string | - | yes |
| allow_major_version_upgrade | Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible | string | `false` | no |
| apply_immediately | Specifies whether any database modifications are applied immediately, or during the next maintenance window | string | `false` | no |
| auto_minor_version_upgrade | Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window | string | `true` | no |
| availability_zone | The Availability Zone of the RDS instance | string | `` | no |
| backup_retention_period | The days to retain backups for | string | `1` | no |
| backup_window | The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window | string | - | yes |
| character_set_name | (Optional) The character set name to use for DB encoding in Oracle instances. This can't be changed. See Oracle Character Sets Supported in Amazon RDS for more information | string | `` | no |
| copy_tags_to_snapshot | On delete, copy all Instance tags to the final snapshot (if final_snapshot_identifier is specified) | string | `false` | no |
| create_db_instance | Whether to create a database instance | string | `true` | no |
| create_db_option_group | Whether to create a database option group | string | `true` | no |
| create_db_parameter_group | Whether to create a database parameter group | string | `true` | no |
| create_db_subnet_group | Whether to create a database subnet group | string | `true` | no |
| create_monitoring_role | Create IAM role with a defined name that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. | string | `false` | no |
| db_subnet_group_name | Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC | string | `` | no |
| deletion_protection | The database can't be deleted when this value is set to true. | string | `false` | no |
| enabled_cloudwatch_logs_exports | List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace. | string | `<list>` | no |
| engine | The database engine to use | string | - | yes |
| engine_version | The engine version to use | string | - | yes |
| family | The family of the DB parameter group | string | `` | no |
| final_snapshot_identifier | The name of your final DB snapshot when this DB instance is deleted. | string | `false` | no |
| iam_database_authentication_enabled | Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled | string | `false` | no |
| identifier | The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier | string | - | yes |
| instance_class | The instance type of the RDS instance | string | - | yes |
| iops | The amount of provisioned IOPS. Setting this implies a storage_type of 'io1' | string | `0` | no |
| kms_key_id | The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN. If storage_encrypted is set to true and kms_key_id is not specified the default KMS key created in your account will be used | string | `` | no |
| license_model | License model information for this DB instance. Optional, but required for some DB engines, i.e. Oracle SE1 | string | `` | no |
| maintenance_window | The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00' | string | - | yes |
| major_engine_version | Specifies the major version of the engine that this option group should be associated with | string | `` | no |
| monitoring_interval | The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60. | string | `0` | no |
| monitoring_role_arn | The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. Must be specified if monitoring_interval is non-zero. | string | `` | no |
| monitoring_role_name | Name of the IAM role which will be created when create_monitoring_role is enabled. | string | `rds-monitoring-role` | no |
| multi_az | Specifies if the RDS instance is multi-AZ | string | `false` | no |
| name | The DB name to create. If omitted, no database is created initially | string | `` | no |
| option_group_description | The description of the option group | string | `` | no |
| option_group_name | Name of the DB option group to associate. Setting this automatically disables option_group creation | string | `` | no |
| options | A list of Options to apply. | list | `<list>` | no |
| parameter_group_name | Name of the DB parameter group to associate. Setting this automatically disables parameter_group creation | string | `` | no |
| parameters | A list of DB parameters (map) to apply | string | `<list>` | no |
| password | Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file | string | - | yes |
| port | The port on which the DB accepts connections | string | - | yes |
| publicly_accessible | Bool to control if instance is publicly accessible | string | `false` | no |
| replicate_source_db | Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate. | string | `` | no |
| skip_final_snapshot | Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier | string | `true` | no |
| snapshot_identifier | Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console, e.g: rds:production-2015-06-26-06-05. | string | `` | no |
| storage_encrypted | Specifies whether the DB instance is encrypted | string | `false` | no |
| storage_type | One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'standard' if not. Note that this behaviour is different from the AWS web console, where the default is 'gp2'. | string | `gp2` | no |
| subnet_ids | A list of VPC subnet IDs | list | `<list>` | no |
| tags | A mapping of tags to assign to all resources | string | `<map>` | no |
| timeouts | (Optional) Updated Terraform resource management timeouts. Applies to `aws_db_instance` in particular to permit resource management times | map | `<map>` | no |
| timezone | (Optional) Time zone of the DB instance. timezone is currently only supported by Microsoft SQL Server. The timezone can only be set on creation. See MSSQL User Guide for more information. | string | `` | no |
| username | Username for the master DB user | string | - | yes |
| vpc_security_group_ids | List of VPC security groups to associate | string | `<list>` | no |

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
| this_db_option_group_arn | The ARN of the db option group |
| this_db_option_group_id | DB option group |
| this_db_parameter_group_arn | The ARN of the db parameter group |
| this_db_parameter_group_id | The db parameter group id |
| this_db_subnet_group_arn | The ARN of the db subnet group |
| this_db_subnet_group_id | The db subnet group name |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Currently maintained by [these awesome contributors](https://github.com/terraform-aws-modules/terraform-aws-rds/graphs/contributors).
Migrated from `terraform-community-modules/tf_aws_rds`, where it was maintained by [these awesome contributors](https://github.com/terraform-community-modules/tf_aws_rds/graphs/contributors).
Module managed by [Anton Babenko](https://github.com/antonbabenko).

## License

Apache 2 Licensed. See LICENSE for full details.

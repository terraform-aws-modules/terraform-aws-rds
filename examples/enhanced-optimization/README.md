<p align="center">
  <img src="https://github.com/intel/terraform-intel-aws-mysql/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel® Cloud Optimization Modules for Terraform

© Copyright 2023, Intel Corporation

## AWS RDS MySQL module

Configuration in this directory creates an Amazon RDS instance for MySQL. The instance is created on an Intel Icelake instance M6i.xlarge by default. The instance is pre-configured with parameters within the database parameter group that is optimized for Intel architecture. The goal of this module is to get you started with a database configured to run best on Intel architecture.

As you configure your application's environment, choose the configurations for your infrastructure that matches your application's requirements.

The MySQL Optimizations were based off [Intel Xeon Tunning guides](<https://www.intel.com/content/www/us/en/developer/articles/guide/open-source-database-tuning-guide-on-xeon-systems.html>)

## Usage

**See examples folder for complete examples.**


By default, you will only have to pass three variables
```hcl
db_password
rds_identifier
vpc_id
```

variables.tf
```hcl
variable "db_password" {
  description = "Password for the master database user."
  type        = string
  sensitive   = true
}
```

main.tf
```hcl
module "optimized-mysql-server" {
  source         = "intel/aws-mysql/intel"
  db_password    = var.db_password
  rds_identifier = "<NAME-FOR-RDS-INSTANCE>"
  vpc_id         = "<YOUR-VPC-ID>"
}
```

Run terraform

```bash
export TF_VAR_db_password ='<USE_A_STRONG_PASSWORD>'

terraform init  
terraform plan
terraform apply
```

## Considerations

- Check in the variables.tf file for the region where this database instance will be created. It is defaulted to run in us-west-1 region within AWS. If you want to run it within any other region, make changes accordingly within the Terraform code

- Check the variables.tf file for incoming ports allowed to connect to the database instance. The variable name is ingress_cidr_blocks. Currently it is defaulted to be open to the world like 0.0.0.0/0. Before runing the code, configure it based on specific security policies and requirements within the environment it is being implemented

- Check if you getting errors while running this Terraform code due to AWS defined soft limits or hard limits within your AWS account. Please work with your AWS support team to resolve limit constraints

- Using HashiCorp Modules alongside green-blue deployment allows for a secure and efficient deployment process. The modules can be easily integrated into both the active and inactive environments, ensuring consistency across both environments.
   - Instance - If you apply the instances will shut down immediately and restart, creating service interruption.
   - Platform - If you apply, it will wait for the next maintenance window to change the instance & configuration. You can force apply with additional TF code.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.36.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~>3.4.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.36.0 |
| <a name="provider_random"></a> [random](#provider\_random) | ~>3.4.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_parameter_group.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | resource |
| [aws_db_subnet_group.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_security_group.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [random_id.rid](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [aws_subnets.vpc_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_major_version_upgrades"></a> [auto\_major\_version\_upgrades](#input\_auto\_major\_version\_upgrades) | Flag that specifices if major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible. | `bool` | `false` | no |
| <a name="input_auto_minor_version_upgrades"></a> [auto\_minor\_version\_upgrades](#input\_auto\_minor\_version\_upgrades) | Flag that specifies if minor engine upgrades will be applied automatically to the DB instance during the maintenance window. | `bool` | `true` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | Availability zone where the RDS instance will be instantiated. | `string` | `null` | no |
| <a name="input_aws_security_group_name"></a> [aws\_security\_group\_name](#input\_aws\_security\_group\_name) | security group name for the rds | `string` | `"mysql_rds"` | no |
| <a name="input_create_security_group"></a> [create\_security\_group](#input\_create\_security\_group) | Flag that allows for the creation of a security group that allows access to the instance. Please use this for non-production use cases only. | `bool` | `false` | no |
| <a name="input_create_subnet_group"></a> [create\_subnet\_group](#input\_create\_subnet\_group) | Flag that allows for the creation of a subnet group that allows public access. | `bool` | `true` | no |
| <a name="input_db_allocated_storage"></a> [db\_allocated\_storage](#input\_db\_allocated\_storage) | Allocated storage for AWS database instance. | `number` | `200` | no |
| <a name="input_db_apply_immediately"></a> [db\_apply\_immediately](#input\_db\_apply\_immediately) | Flag that specifies whether any database modifications are applied immediately, or during the next maintenance window. | `bool` | `false` | no |
| <a name="input_db_automated_backup_arn"></a> [db\_automated\_backup\_arn](#input\_db\_automated\_backup\_arn) | The ARN of the automated backup from which to restore. Required if source\_db\_instance\_identifier or source\_dbi\_resource\_id is not specified. | `string` | `null` | no |
| <a name="input_db_backup_retention_period"></a> [db\_backup\_retention\_period](#input\_db\_backup\_retention\_period) | The days to retain backups for. Must be between 0 and 35. Must be greater than 0 if the database is used as a source for a Read Replica. | `number` | `7` | no |
| <a name="input_db_backup_window"></a> [db\_backup\_window](#input\_db\_backup\_window) | The daily time range (in UTC) during which automated backups are created if they are enabled. Example: `09:46-10:16.` Must not overlap with maintenance\_window. | `string` | `null` | no |
| <a name="input_db_ca_cert_identifier"></a> [db\_ca\_cert\_identifier](#input\_db\_ca\_cert\_identifier) | The identifier of the CA certificate for the DB instance. | `string` | `null` | no |
| <a name="input_db_cloudwatch_logs_export"></a> [db\_cloudwatch\_logs\_export](#input\_db\_cloudwatch\_logs\_export) | Set of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. | `list(string)` | `[]` | no |
| <a name="input_db_custom_iam_profile"></a> [db\_custom\_iam\_profile](#input\_db\_custom\_iam\_profile) | (The instance profile associated with the underlying Amazon EC2 instance of an RDS Custom DB instance. | `string` | `null` | no |
| <a name="input_db_deletion_protection"></a> [db\_deletion\_protection](#input\_db\_deletion\_protection) | Flag that specifies whether the DB instance is protected from deletion. | `bool` | `false` | no |
| <a name="input_db_domain"></a> [db\_domain](#input\_db\_domain) | The ID of the Directory Service Active Directory domain to create the instance in. | `string` | `null` | no |
| <a name="input_db_domain_iam_role"></a> [db\_domain\_iam\_role](#input\_db\_domain\_iam\_role) | (Required if db\_domain is provided) The name of the IAM role to be used when making API calls to the Directory Service. | `string` | `null` | no |
| <a name="input_db_encryption"></a> [db\_encryption](#input\_db\_encryption) | Flag that specifies whether the DB instance is encrypted. | `bool` | `true` | no |
| <a name="input_db_engine"></a> [db\_engine](#input\_db\_engine) | Database engine version for AWS database instance. | `string` | `"mysql"` | no |
| <a name="input_db_engine_version"></a> [db\_engine\_version](#input\_db\_engine\_version) | Database engine version for AWS database instance. | `string` | `"8.0"` | no |
| <a name="input_db_iam_authentication"></a> [db\_iam\_authentication](#input\_db\_iam\_authentication) | Flag that specifies whether mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled. | `bool` | `false` | no |
| <a name="input_db_iops"></a> [db\_iops](#input\_db\_iops) | The amount of provisioned IOPS. Setting this implies a storage\_type of io1. | `number` | `10000` | no |
| <a name="input_db_maintenance_window"></a> [db\_maintenance\_window](#input\_db\_maintenance\_window) | The window to perform maintenance in. Syntax: ddd:hh24:mi-ddd:hh24:mi | `string` | `null` | no |
| <a name="input_db_max_allocated_storage"></a> [db\_max\_allocated\_storage](#input\_db\_max\_allocated\_storage) | When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated\_storage. Must be greater than or equal to allocated\_storage or 0 to disable Storage Autoscaling. | `number` | `10000` | no |
| <a name="input_db_monitoring_interval"></a> [db\_monitoring\_interval](#input\_db\_monitoring\_interval) | The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance | `string` | `0` | no |
| <a name="input_db_monitoring_role_arn"></a> [db\_monitoring\_role\_arn](#input\_db\_monitoring\_role\_arn) | The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs | `string` | `null` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | Name of the database that will be created on the RDS instance. If this is specified then a database will be created as a part of the instance provisioning process. | `string` | `null` | no |
| <a name="input_db_option_group"></a> [db\_option\_group](#input\_db\_option\_group) | Option group name to associate with the database instance. | `string` | `null` | no |
| <a name="input_db_parameter_group_family"></a> [db\_parameter\_group\_family](#input\_db\_parameter\_group\_family) | Family identifier for the RDS database parameter group. | `string` | `"mysql8.0"` | no |
| <a name="input_db_parameter_group_name"></a> [db\_parameter\_group\_name](#input\_db\_parameter\_group\_name) | Name for the RDS database parameter group. | `string` | `"mysql"` | no |
| <a name="input_db_parameters"></a> [db\_parameters](#input\_db\_parameters) | Intel Cloud optimizations for Xeon processors | <pre>object({<br>    mysql = object({<br>      table_open_cache = optional(object({<br>        value        = optional(string, "8000")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      table_open_cache_instances = optional(object({<br>        value        = optional(string, "16")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      max_connections = optional(object({<br>        value        = optional(string, "4000")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      back_log = optional(object({<br>        value        = optional(string, "1500")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      default_password_lifetime = optional(object({<br>        value        = optional(string, "0")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      performance_schema = optional(object({<br>        value        = optional(string, "0")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      max_prepared_stmt_count = optional(object({<br>        value        = optional(string, "128000")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      character_set_server = optional(object({<br>        value        = optional(string, "latin1")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      collation_server = optional(object({<br>        value        = optional(string, "latin1_swedish_ci")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      transaction_isolation = optional(object({<br>        value        = optional(string, "REPEATABLE-READ")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_log_file_size = optional(object({<br>        value        = optional(string, 1024 * 1024 * 1024)<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      innodb_open_files = optional(object({<br>        value        = optional(string, "4000")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      innodb_file_per_table = optional(object({<br>        value        = optional(string, "1")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      innodb_buffer_pool_instances = optional(object({<br>        value        = optional(string, "16")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      innodb_buffer_pool_size = optional(object({<br>        value        = optional(string, "64424509440") # 60 Gigabytes #Calculator https://convertlive.com/u/convert/gigabytes/to/bytes<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      innodb_log_buffer_size = optional(object({<br>        value        = optional(string, "67108864")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      innodb_thread_concurrency = optional(object({<br>        value        = optional(string, "0")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_flush_log_at_trx_commit = optional(object({<br>        value        = optional(string, "0")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_max_dirty_pages_pct = optional(object({<br>        value        = optional(string, "90")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_max_dirty_pages_pct_lwm = optional(object({<br>        value        = optional(string, "10")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      join_buffer_size = optional(object({<br>        value        = optional(string, 32 * 1024)<br>        apply_method = optional(string, "immediate")<br>      }))<br>      sort_buffer_size = optional(object({<br>        value        = optional(string, 32 * 1024)<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_use_native_aio = optional(object({<br>        value        = optional(string, "1")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      innodb_stats_persistent = optional(object({<br>        value        = optional(string, "ON")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_spin_wait_delay = optional(object({<br>        value        = optional(string, "6")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_max_purge_lag_delay = optional(object({<br>        value        = optional(string, "300000")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_max_purge_lag = optional(object({<br>        value        = optional(string, "0")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_checksum_algorithm = optional(object({<br>        value        = optional(string, "none")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_io_capacity = optional(object({<br>        value        = optional(string, "4000")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_io_capacity_max = optional(object({<br>        value        = optional(string, "20000")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_lru_scan_depth = optional(object({<br>        value        = optional(string, "9000")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_change_buffering = optional(object({<br>        value        = optional(string, "none")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_page_cleaners = optional(object({<br>        value        = optional(string, "4")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      innodb_undo_log_truncate = optional(object({<br>        value        = optional(string, "0")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      innodb_adaptive_flushing = optional(object({<br>        value        = optional(string, "1")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_flush_neighbors = optional(object({<br>        value        = optional(string, "0")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_read_io_threads = optional(object({<br>        value        = optional(string, "16")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      innodb_write_io_threads = optional(object({<br>        value        = optional(string, "16")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      innodb_purge_threads = optional(object({<br>        value        = optional(string, "4")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      innodb_adaptive_hash_index = optional(object({<br>        value        = optional(string, "0")<br>        apply_method = optional(string, "immediate")<br>      }))<br>    })<br>  })</pre> | <pre>{<br>  "mysql": {<br>    "back_log": {},<br>    "character_set_server": {},<br>    "collation_server": {},<br>    "default_password_lifetime": {},<br>    "innodb_adaptive_flushing": {},<br>    "innodb_adaptive_hash_index": {},<br>    "innodb_buffer_pool_instances": {},<br>    "innodb_buffer_pool_size": {},<br>    "innodb_change_buffering": {},<br>    "innodb_checksum_algorithm": {},<br>    "innodb_file_per_table": {},<br>    "innodb_flush_log_at_trx_commit": {},<br>    "innodb_flush_neighbors": {},<br>    "innodb_io_capacity": {},<br>    "innodb_io_capacity_max": {},<br>    "innodb_log_buffer_size": {},<br>    "innodb_log_file_size": {},<br>    "innodb_lru_scan_depth": {},<br>    "innodb_max_dirty_pages_pct": {},<br>    "innodb_max_dirty_pages_pct_lwm": {},<br>    "innodb_max_purge_lag": {},<br>    "innodb_max_purge_lag_delay": {},<br>    "innodb_open_files": {},<br>    "innodb_page_cleaners": {},<br>    "innodb_purge_threads": {},<br>    "innodb_read_io_threads": {},<br>    "innodb_spin_wait_delay": {},<br>    "innodb_stats_persistent": {},<br>    "innodb_thread_concurrency": {},<br>    "innodb_undo_log_truncate": {},<br>    "innodb_use_native_aio": {},<br>    "innodb_write_io_threads": {},<br>    "join_buffer_size": {},<br>    "max_connections": {},<br>    "max_prepared_stmt_count": {},<br>    "performance_schema": {},<br>    "sort_buffer_size": {},<br>    "table_open_cache": {},<br>    "table_open_cache_instances": {},<br>    "transaction_isolation": {}<br>  }<br>}</pre> | no |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | Password for the master database user. | `string` | n/a | yes |
| <a name="input_db_performance_insights"></a> [db\_performance\_insights](#input\_db\_performance\_insights) | Flag that specifies whether Performance Insights are enabled. | `bool` | `false` | no |
| <a name="input_db_performance_insights_kms_key_id"></a> [db\_performance\_insights\_kms\_key\_id](#input\_db\_performance\_insights\_kms\_key\_id) | The ARN for the KMS key to encrypt Performance Insights data. | `string` | `null` | no |
| <a name="input_db_performance_retention_period"></a> [db\_performance\_retention\_period](#input\_db\_performance\_retention\_period) | Amount of time in days to retain Performance Insights data.Valid values are 7, 731 (2 years) or a multiple of 31. | `string` | `null` | no |
| <a name="input_db_port"></a> [db\_port](#input\_db\_port) | The port on which the DB accepts connections. | `number` | `null` | no |
| <a name="input_db_publicly_accessible"></a> [db\_publicly\_accessible](#input\_db\_publicly\_accessible) | Flag to indicate whether the database will be publicly accessible. | `bool` | `false` | no |
| <a name="input_db_replicate_source_db"></a> [db\_replicate\_source\_db](#input\_db\_replicate\_source\_db) | Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate (if replicating within a single region) or ARN of the Amazon RDS Database to replicate (if replicating cross-region). Note that if you are creating a cross-region replica of an encrypted database you will also need to specify a kms\_key\_id. | `string` | `null` | no |
| <a name="input_db_restore_time"></a> [db\_restore\_time](#input\_db\_restore\_time) | The date and time to restore from. Value must be a time in Universal Coordinated Time (UTC) format and must be before the latest restorable time for the DB instance. | `string` | `null` | no |
| <a name="input_db_snapshot_identifier"></a> [db\_snapshot\_identifier](#input\_db\_snapshot\_identifier) | Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console. | `string` | `null` | no |
| <a name="input_db_source_db_instance_id"></a> [db\_source\_db\_instance\_id](#input\_db\_source\_db\_instance\_id) | The identifier of the source DB instance from which to restore. Must match the identifier of an existing DB instance. Required if source\_db\_instance\_automated\_backups\_arn or source\_dbi\_resource\_id is not specified. | `string` | `null` | no |
| <a name="input_db_source_dbi_resource_id"></a> [db\_source\_dbi\_resource\_id](#input\_db\_source\_dbi\_resource\_id) | The resource ID of the source DB instance from which to restore. Required if source\_db\_instance\_identifier or source\_db\_instance\_automated\_backups\_arn is not specified. | `string` | `null` | no |
| <a name="input_db_storage_type"></a> [db\_storage\_type](#input\_db\_storage\_type) | The storage type that will be set on the instance. If db\_iops is set then this will be set to io1 | `string` | `"io1"` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | Database subnet group name. | `string` | `null` | no |
| <a name="input_db_subnet_group_tag"></a> [db\_subnet\_group\_tag](#input\_db\_subnet\_group\_tag) | Tag for the database subnet group. | `map(string)` | <pre>{<br>  "Name": "mysql"<br>}</pre> | no |
| <a name="input_db_tags"></a> [db\_tags](#input\_db\_tags) | Map of tags to apply to the database instance. | `map(string)` | `null` | no |
| <a name="input_db_timeouts"></a> [db\_timeouts](#input\_db\_timeouts) | Map of timeouts that can be adjusted when executing the module. This allows you to customize how long certain operations are allowed to take before being considered to have failed. | <pre>object({<br>    create = optional(string, null)<br>    delete = optional(string, null)<br>    update = optional(string, null)<br>  })</pre> | <pre>{<br>  "db_timeouts": {}<br>}</pre> | no |
| <a name="input_db_use_latest_restore_time"></a> [db\_use\_latest\_restore\_time](#input\_db\_use\_latest\_restore\_time) | Flag that indicates whether the DB instance is restored from the latest backup time. | `bool` | `null` | no |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | Username for the master database user. | `string` | `null` | no |
| <a name="input_egress_cidr_blocks"></a> [egress\_cidr\_blocks](#input\_egress\_cidr\_blocks) | Egress CIDR block for the RDS security group. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_egress_from_port"></a> [egress\_from\_port](#input\_egress\_from\_port) | Starting egress port for the RDS security group. | `number` | `3306` | no |
| <a name="input_egress_protocol"></a> [egress\_protocol](#input\_egress\_protocol) | Egress protocol for the port defined in the RDS security group. | `string` | `"tcp"` | no |
| <a name="input_egress_to_port"></a> [egress\_to\_port](#input\_egress\_to\_port) | Ending egress port for the RDS security group. | `number` | `3306` | no |
| <a name="input_final_snapshot_prefix"></a> [final\_snapshot\_prefix](#input\_final\_snapshot\_prefix) | The name which is prefixed to the final snapshot on database termination. | `string` | `"mysql-snap-"` | no |
| <a name="input_ingress_cidr_blocks"></a> [ingress\_cidr\_blocks](#input\_ingress\_cidr\_blocks) | Ingress CIDR block for the RDS security group. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_ingress_from_port"></a> [ingress\_from\_port](#input\_ingress\_from\_port) | Starting ingress port for the RDS security group. | `number` | `3306` | no |
| <a name="input_ingress_protocol"></a> [ingress\_protocol](#input\_ingress\_protocol) | Ingress protocol for the port defined in the RDS security group. | `string` | `"tcp"` | no |
| <a name="input_ingress_to_port"></a> [ingress\_to\_port](#input\_ingress\_to\_port) | Ending ingress port for the RDS security group. | `number` | `3306` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | Instance class that will be used by the RDS instance. | `string` | `"db.m6i.2xlarge"` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN. | `string` | `null` | no |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | Flag that specifies if the RDS instance is multi\_az. | `bool` | `true` | no |
| <a name="input_rds_identifier"></a> [rds\_identifier](#input\_rds\_identifier) | Name of the RDS instance that will be created. | `string` | n/a | yes |
| <a name="input_rds_security_group_tag"></a> [rds\_security\_group\_tag](#input\_rds\_security\_group\_tag) | Map of tags for the RDS security group. | `map(string)` | <pre>{<br>  "Name": "mysql_rds"<br>}</pre> | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of existing AWS security groups that will be attached to the RDS instance. | `list(string)` | `null` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Flag to indicate whether a final snapshot will be skipped upon database termination. | `bool` | `false` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID within which the database resource will be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_allocated_storage"></a> [db\_allocated\_storage](#output\_db\_allocated\_storage) | Storage that was allocated to the instance when it configured. |
| <a name="output_db_arn"></a> [db\_arn](#output\_db\_arn) | ARN of the database instance. |
| <a name="output_db_automated_backup_arn"></a> [db\_automated\_backup\_arn](#output\_db\_automated\_backup\_arn) | The ARN of the automated backup from which to restore. |
| <a name="output_db_backup_retention"></a> [db\_backup\_retention](#output\_db\_backup\_retention) | Number of configured backups to keep for the database instance. |
| <a name="output_db_backup_window"></a> [db\_backup\_window](#output\_db\_backup\_window) | Configured backup window for the database instance. |
| <a name="output_db_ca_cert_identifier"></a> [db\_ca\_cert\_identifier](#output\_db\_ca\_cert\_identifier) | The identifier of the CA certificate for the DB instance. |
| <a name="output_db_custom_iam_profile"></a> [db\_custom\_iam\_profile](#output\_db\_custom\_iam\_profile) | The instance profile associated with the underlying Amazon EC2 instance of an RDS Custom DB instance. |
| <a name="output_db_delete_automated_backups"></a> [db\_delete\_automated\_backups](#output\_db\_delete\_automated\_backups) | Flag that specifies if automated backups are deleted. |
| <a name="output_db_domain_iam_role"></a> [db\_domain\_iam\_role](#output\_db\_domain\_iam\_role) | The name of the IAM role to be used when making API calls to the Directory Service. |
| <a name="output_db_encryption"></a> [db\_encryption](#output\_db\_encryption) | Flag that indicates if storage encryption is enabled. |
| <a name="output_db_endpoint"></a> [db\_endpoint](#output\_db\_endpoint) | Connection endpoint for the database instance that has been created. |
| <a name="output_db_engine"></a> [db\_engine](#output\_db\_engine) | Database instance engine that was configured. |
| <a name="output_db_engine_version_actual"></a> [db\_engine\_version\_actual](#output\_db\_engine\_version\_actual) | Running engine version of the database (full version number) |
| <a name="output_db_final_snapshot_identifier"></a> [db\_final\_snapshot\_identifier](#output\_db\_final\_snapshot\_identifier) | Final snapshot identifier for the database instance. |
| <a name="output_db_hosted_zone_id"></a> [db\_hosted\_zone\_id](#output\_db\_hosted\_zone\_id) | Hosted zone ID for the database instance. |
| <a name="output_db_hostname"></a> [db\_hostname](#output\_db\_hostname) | Database instance hostname. |
| <a name="output_db_iam_auth_enabled"></a> [db\_iam\_auth\_enabled](#output\_db\_iam\_auth\_enabled) | Flag that specifies if iam authenticaiton is enabled on the database |
| <a name="output_db_instance_id"></a> [db\_instance\_id](#output\_db\_instance\_id) | RDS instance ID. |
| <a name="output_db_iops"></a> [db\_iops](#output\_db\_iops) | Database instance iops that was configured. |
| <a name="output_db_kms_key_id"></a> [db\_kms\_key\_id](#output\_db\_kms\_key\_id) | KMS key that is configured on the database instance if storage encryption is enabled. |
| <a name="output_db_latest_restore_time"></a> [db\_latest\_restore\_time](#output\_db\_latest\_restore\_time) | Latest available restorable time for the database instance. |
| <a name="output_db_maintenance_window"></a> [db\_maintenance\_window](#output\_db\_maintenance\_window) | Maintainence window for the database instance. |
| <a name="output_db_max_allocated_storage"></a> [db\_max\_allocated\_storage](#output\_db\_max\_allocated\_storage) | Maximum storage allocation that is configured on the database instance. |
| <a name="output_db_monitoring_interval"></a> [db\_monitoring\_interval](#output\_db\_monitoring\_interval) | Monitoring interval configuration. |
| <a name="output_db_name"></a> [db\_name](#output\_db\_name) | Name of the database that was created (if specified) during instance creation. |
| <a name="output_db_parameter_group"></a> [db\_parameter\_group](#output\_db\_parameter\_group) | Parameter group that was created |
| <a name="output_db_password"></a> [db\_password](#output\_db\_password) | Database instance master password. |
| <a name="output_db_performance_insights"></a> [db\_performance\_insights](#output\_db\_performance\_insights) | Flag that indiciates if Performance Insights is enabled. |
| <a name="output_db_performance_insights_kms_key_id"></a> [db\_performance\_insights\_kms\_key\_id](#output\_db\_performance\_insights\_kms\_key\_id) | ARN of the KMS key that Performance Insights is utilizing (if enabled). |
| <a name="output_db_performance_insights_retention_period"></a> [db\_performance\_insights\_retention\_period](#output\_db\_performance\_insights\_retention\_period) | Data retention period for Performance Insights (if enabled). |
| <a name="output_db_port"></a> [db\_port](#output\_db\_port) | Database instance port. |
| <a name="output_db_restore_time"></a> [db\_restore\_time](#output\_db\_restore\_time) | The date and time to restore from. |
| <a name="output_db_security_group"></a> [db\_security\_group](#output\_db\_security\_group) | Security Group that was created (if specified) during the run. |
| <a name="output_db_security_group_ids"></a> [db\_security\_group\_ids](#output\_db\_security\_group\_ids) | Security Group IDs that were associated with the database instance. |
| <a name="output_db_source_db_instance_id"></a> [db\_source\_db\_instance\_id](#output\_db\_source\_db\_instance\_id) | The identifier of the source DB instance from which to restore. |
| <a name="output_db_source_dbi_resource_id"></a> [db\_source\_dbi\_resource\_id](#output\_db\_source\_dbi\_resource\_id) | The resource ID of the source DB instance from which to restore. |
| <a name="output_db_status"></a> [db\_status](#output\_db\_status) | Status of the database instance that was created. |
| <a name="output_db_storage_type"></a> [db\_storage\_type](#output\_db\_storage\_type) | Storage type that is configured on the database instance. |
| <a name="output_db_subnet_group"></a> [db\_subnet\_group](#output\_db\_subnet\_group) | Name of the subnet group that is associated with the database instance. |
| <a name="output_db_username"></a> [db\_username](#output\_db\_username) | Database instance master username. |
| <a name="output_instance_class"></a> [instance\_class](#output\_instance\_class) | Instance class in use for the database instance that was created. |
<!-- END_TF_DOCS -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.36.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~>3.4.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.36.1 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_parameter_group.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | resource |
| [aws_db_subnet_group.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_security_group.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [random_id.rid](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [aws_subnets.vpc_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_major_version_upgrades"></a> [auto\_major\_version\_upgrades](#input\_auto\_major\_version\_upgrades) | Flag that specifices if major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible. | `bool` | `false` | no |
| <a name="input_auto_minor_version_upgrades"></a> [auto\_minor\_version\_upgrades](#input\_auto\_minor\_version\_upgrades) | Flag that specifies if minor engine upgrades will be applied automatically to the DB instance during the maintenance window. | `bool` | `true` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | Availability zone where the RDS instance will be instantiated. | `string` | `null` | no |
| <a name="input_aws_database_instance_identifier"></a> [aws\_database\_instance\_identifier](#input\_aws\_database\_instance\_identifier) | Identifier for the AWS database instance. | `string` | `"mysql"` | no |
| <a name="input_aws_security_group_name"></a> [aws\_security\_group\_name](#input\_aws\_security\_group\_name) | security group name for the rds | `string` | `"mysql_rds"` | no |
| <a name="input_create_security_group"></a> [create\_security\_group](#input\_create\_security\_group) | Flag that allows for the creation of a security group that allows access to the instance. Please use this for non-production use cases only. | `bool` | `false` | no |
| <a name="input_create_subnet_group"></a> [create\_subnet\_group](#input\_create\_subnet\_group) | Flag that allows for the creation of a subnet group that allows public access. | `bool` | `false` | no |
| <a name="input_db_allocated_storage"></a> [db\_allocated\_storage](#input\_db\_allocated\_storage) | Allocated storage for AWS database instance. | `number` | `200` | no |
| <a name="input_db_apply_immediately"></a> [db\_apply\_immediately](#input\_db\_apply\_immediately) | Flag that specifies whether any database modifications are applied immediately, or during the next maintenance window. | `bool` | `false` | no |
| <a name="input_db_automated_backup_arn"></a> [db\_automated\_backup\_arn](#input\_db\_automated\_backup\_arn) | The ARN of the automated backup from which to restore. Required if source\_db\_instance\_identifier or source\_dbi\_resource\_id is not specified. | `string` | `null` | no |
| <a name="input_db_backup_retention_period"></a> [db\_backup\_retention\_period](#input\_db\_backup\_retention\_period) | The days to retain backups for. Must be between 0 and 35. Must be greater than 0 if the database is used as a source for a Read Replica. | `number` | `7` | no |
| <a name="input_db_backup_window"></a> [db\_backup\_window](#input\_db\_backup\_window) | The daily time range (in UTC) during which automated backups are created if they are enabled. Example: `09:46-10:16.` Must not overlap with maintenance\_window. | `string` | `null` | no |
| <a name="input_db_ca_cert_identifier"></a> [db\_ca\_cert\_identifier](#input\_db\_ca\_cert\_identifier) | The identifier of the CA certificate for the DB instance. | `string` | `null` | no |
| <a name="input_db_cloudwatch_logs_export"></a> [db\_cloudwatch\_logs\_export](#input\_db\_cloudwatch\_logs\_export) | Set of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. | `list(string)` | `[]` | no |
| <a name="input_db_custom_iam_profile"></a> [db\_custom\_iam\_profile](#input\_db\_custom\_iam\_profile) | (The instance profile associated with the underlying Amazon EC2 instance of an RDS Custom DB instance. | `string` | `null` | no |
| <a name="input_db_deletion_protection"></a> [db\_deletion\_protection](#input\_db\_deletion\_protection) | Flag that specifies whether the DB instance is protected from deletion. | `bool` | `false` | no |
| <a name="input_db_domain"></a> [db\_domain](#input\_db\_domain) | The ID of the Directory Service Active Directory domain to create the instance in. | `string` | `null` | no |
| <a name="input_db_domain_iam_role"></a> [db\_domain\_iam\_role](#input\_db\_domain\_iam\_role) | (Required if db\_domain is provided) The name of the IAM role to be used when making API calls to the Directory Service. | `string` | `null` | no |
| <a name="input_db_encryption"></a> [db\_encryption](#input\_db\_encryption) | Flag that specifies whether the DB instance is encrypted. | `bool` | `true` | no |
| <a name="input_db_engine"></a> [db\_engine](#input\_db\_engine) | Database engine version for AWS database instance. | `string` | `"mysql"` | no |
| <a name="input_db_engine_version"></a> [db\_engine\_version](#input\_db\_engine\_version) | Database engine version for AWS database instance. | `string` | `"8.0"` | no |
| <a name="input_db_iam_authentication"></a> [db\_iam\_authentication](#input\_db\_iam\_authentication) | Flag that specifies whether mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled. | `bool` | `false` | no |
| <a name="input_db_iops"></a> [db\_iops](#input\_db\_iops) | The amount of provisioned IOPS. Setting this implies a storage\_type of io1. | `number` | `10000` | no |
| <a name="input_db_maintenance_window"></a> [db\_maintenance\_window](#input\_db\_maintenance\_window) | The window to perform maintenance in. Syntax: ddd:hh24:mi-ddd:hh24:mi | `string` | `null` | no |
| <a name="input_db_max_allocated_storage"></a> [db\_max\_allocated\_storage](#input\_db\_max\_allocated\_storage) | When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated\_storage. Must be greater than or equal to allocated\_storage or 0 to disable Storage Autoscaling. | `number` | `10000` | no |
| <a name="input_db_monitoring_interval"></a> [db\_monitoring\_interval](#input\_db\_monitoring\_interval) | The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance | `string` | `0` | no |
| <a name="input_db_monitoring_role_arn"></a> [db\_monitoring\_role\_arn](#input\_db\_monitoring\_role\_arn) | The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs | `string` | `null` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | Name of the database that will be created on the RDS instance. If this is specified then a database will be created as a part of the instance provisioning process. | `string` | `null` | no |
| <a name="input_db_option_group"></a> [db\_option\_group](#input\_db\_option\_group) | Option group name to associate with the database instance. | `string` | `null` | no |
| <a name="input_db_parameter_group_family"></a> [db\_parameter\_group\_family](#input\_db\_parameter\_group\_family) | Family identifier for the RDS database parameter group. | `string` | `"mysql8.0"` | no |
| <a name="input_db_parameter_group_name"></a> [db\_parameter\_group\_name](#input\_db\_parameter\_group\_name) | Name for the RDS database parameter group. | `string` | `"mysql"` | no |
| <a name="input_db_parameters"></a> [db\_parameters](#input\_db\_parameters) | Intel Cloud optimizations for Xeon processors | <pre>object({<br>    mysql = object({<br>      table_open_cache = optional(object({<br>        value        = optional(string, "8000")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      table_open_cache_instances = optional(object({<br>        value        = optional(string, "16")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      max_connections = optional(object({<br>        value        = optional(string, "4000")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      back_log = optional(object({<br>        value        = optional(string, "1500")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      default_password_lifetime = optional(object({<br>        value        = optional(string, "0")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      performance_schema = optional(object({<br>        value        = optional(string, "0")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      max_prepared_stmt_count = optional(object({<br>        value        = optional(string, "128000")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      character_set_server = optional(object({<br>        value        = optional(string, "latin1")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      collation_server = optional(object({<br>        value        = optional(string, "latin1_swedish_ci")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      transaction_isolation = optional(object({<br>        value        = optional(string, "REPEATABLE-READ")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_log_file_size = optional(object({<br>        value        = optional(string, 1024 * 1024 * 1024)<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      innodb_open_files = optional(object({<br>        value        = optional(string, "4000")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      innodb_file_per_table = optional(object({<br>        value        = optional(string, "1")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      innodb_buffer_pool_instances = optional(object({<br>        value        = optional(string, "16")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      innodb_buffer_pool_size = optional(object({<br>        value        = optional(string, "64424509440") # 60 Gigabytes #Calculator https://convertlive.com/u/convert/gigabytes/to/bytes<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      innodb_log_buffer_size = optional(object({<br>        value        = optional(string, "67108864")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      innodb_thread_concurrency = optional(object({<br>        value        = optional(string, "0")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_flush_log_at_trx_commit = optional(object({<br>        value        = optional(string, "0")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_max_dirty_pages_pct = optional(object({<br>        value        = optional(string, "90")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_max_dirty_pages_pct_lwm = optional(object({<br>        value        = optional(string, "10")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      join_buffer_size = optional(object({<br>        value        = optional(string, 32 * 1024)<br>        apply_method = optional(string, "immediate")<br>      }))<br>      sort_buffer_size = optional(object({<br>        value        = optional(string, 32 * 1024)<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_use_native_aio = optional(object({<br>        value        = optional(string, "1")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      innodb_stats_persistent = optional(object({<br>        value        = optional(string, "ON")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_spin_wait_delay = optional(object({<br>        value        = optional(string, "6")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_max_purge_lag_delay = optional(object({<br>        value        = optional(string, "300000")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_max_purge_lag = optional(object({<br>        value        = optional(string, "0")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_checksum_algorithm = optional(object({<br>        value        = optional(string, "none")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_io_capacity = optional(object({<br>        value        = optional(string, "4000")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_io_capacity_max = optional(object({<br>        value        = optional(string, "20000")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_lru_scan_depth = optional(object({<br>        value        = optional(string, "9000")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_change_buffering = optional(object({<br>        value        = optional(string, "none")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_page_cleaners = optional(object({<br>        value        = optional(string, "4")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      innodb_undo_log_truncate = optional(object({<br>        value        = optional(string, "0")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      innodb_adaptive_flushing = optional(object({<br>        value        = optional(string, "1")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_flush_neighbors = optional(object({<br>        value        = optional(string, "0")<br>        apply_method = optional(string, "immediate")<br>      }))<br>      innodb_read_io_threads = optional(object({<br>        value        = optional(string, "16")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      innodb_write_io_threads = optional(object({<br>        value        = optional(string, "16")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      innodb_purge_threads = optional(object({<br>        value        = optional(string, "4")<br>        apply_method = optional(string, "pending-reboot")<br>      }))<br>      innodb_adaptive_hash_index = optional(object({<br>        value        = optional(string, "0")<br>        apply_method = optional(string, "immediate")<br>      }))<br>    })<br>  })</pre> | <pre>{<br>  "mysql": {<br>    "back_log": {},<br>    "character_set_server": {},<br>    "collation_server": {},<br>    "default_password_lifetime": {},<br>    "innodb_adaptive_flushing": {},<br>    "innodb_adaptive_hash_index": {},<br>    "innodb_buffer_pool_instances": {},<br>    "innodb_buffer_pool_size": {},<br>    "innodb_change_buffering": {},<br>    "innodb_checksum_algorithm": {},<br>    "innodb_file_per_table": {},<br>    "innodb_flush_log_at_trx_commit": {},<br>    "innodb_flush_neighbors": {},<br>    "innodb_io_capacity": {},<br>    "innodb_io_capacity_max": {},<br>    "innodb_log_buffer_size": {},<br>    "innodb_log_file_size": {},<br>    "innodb_lru_scan_depth": {},<br>    "innodb_max_dirty_pages_pct": {},<br>    "innodb_max_dirty_pages_pct_lwm": {},<br>    "innodb_max_purge_lag": {},<br>    "innodb_max_purge_lag_delay": {},<br>    "innodb_open_files": {},<br>    "innodb_page_cleaners": {},<br>    "innodb_purge_threads": {},<br>    "innodb_read_io_threads": {},<br>    "innodb_spin_wait_delay": {},<br>    "innodb_stats_persistent": {},<br>    "innodb_thread_concurrency": {},<br>    "innodb_undo_log_truncate": {},<br>    "innodb_use_native_aio": {},<br>    "innodb_write_io_threads": {},<br>    "join_buffer_size": {},<br>    "max_connections": {},<br>    "max_prepared_stmt_count": {},<br>    "performance_schema": {},<br>    "sort_buffer_size": {},<br>    "table_open_cache": {},<br>    "table_open_cache_instances": {},<br>    "transaction_isolation": {}<br>  }<br>}</pre> | no |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | Password for the master database user. | `string` | n/a | yes |
| <a name="input_db_performance_insights"></a> [db\_performance\_insights](#input\_db\_performance\_insights) | Flag that specifies whether Performance Insights are enabled. | `bool` | `false` | no |
| <a name="input_db_performance_insights_kms_key_id"></a> [db\_performance\_insights\_kms\_key\_id](#input\_db\_performance\_insights\_kms\_key\_id) | The ARN for the KMS key to encrypt Performance Insights data. | `string` | `null` | no |
| <a name="input_db_performance_retention_period"></a> [db\_performance\_retention\_period](#input\_db\_performance\_retention\_period) | Amount of time in days to retain Performance Insights data.Valid values are 7, 731 (2 years) or a multiple of 31. | `string` | `null` | no |
| <a name="input_db_port"></a> [db\_port](#input\_db\_port) | The port on which the DB accepts connections. | `number` | `null` | no |
| <a name="input_db_publicly_accessible"></a> [db\_publicly\_accessible](#input\_db\_publicly\_accessible) | Flag to indicate whether the database will be publicly accessible. | `bool` | `false` | no |
| <a name="input_db_replicate_source_db"></a> [db\_replicate\_source\_db](#input\_db\_replicate\_source\_db) | Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate (if replicating within a single region) or ARN of the Amazon RDS Database to replicate (if replicating cross-region). Note that if you are creating a cross-region replica of an encrypted database you will also need to specify a kms\_key\_id. | `string` | `null` | no |
| <a name="input_db_restore_time"></a> [db\_restore\_time](#input\_db\_restore\_time) | The date and time to restore from. Value must be a time in Universal Coordinated Time (UTC) format and must be before the latest restorable time for the DB instance. | `string` | `null` | no |
| <a name="input_db_snapshot_identifier"></a> [db\_snapshot\_identifier](#input\_db\_snapshot\_identifier) | Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console. | `string` | `null` | no |
| <a name="input_db_source_db_instance_id"></a> [db\_source\_db\_instance\_id](#input\_db\_source\_db\_instance\_id) | The identifier of the source DB instance from which to restore. Must match the identifier of an existing DB instance. Required if source\_db\_instance\_automated\_backups\_arn or source\_dbi\_resource\_id is not specified. | `string` | `null` | no |
| <a name="input_db_source_dbi_resource_id"></a> [db\_source\_dbi\_resource\_id](#input\_db\_source\_dbi\_resource\_id) | The resource ID of the source DB instance from which to restore. Required if source\_db\_instance\_identifier or source\_db\_instance\_automated\_backups\_arn is not specified. | `string` | `null` | no |
| <a name="input_db_storage_type"></a> [db\_storage\_type](#input\_db\_storage\_type) | The storage type that will be set on the instance. If db\_iops is set then this will be set to io1 | `string` | `"io1"` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | Database subnet group name. | `string` | `"mysql"` | no |
| <a name="input_db_subnet_group_tag"></a> [db\_subnet\_group\_tag](#input\_db\_subnet\_group\_tag) | Tag for the database subnet group. | `map(string)` | <pre>{<br>  "Name": "mysql"<br>}</pre> | no |
| <a name="input_db_tags"></a> [db\_tags](#input\_db\_tags) | Map of tags to apply to the database instance. | `map(string)` | `null` | no |
| <a name="input_db_timeouts"></a> [db\_timeouts](#input\_db\_timeouts) | Map of timeouts that can be adjusted when executing the module. This allows you to customize how long certain operations are allowed to take before being considered to have failed. | <pre>object({<br>    create = optional(string, null)<br>    delete = optional(string, null)<br>    update = optional(string, null)<br>  })</pre> | <pre>{<br>  "db_timeouts": {}<br>}</pre> | no |
| <a name="input_db_use_latest_restore_time"></a> [db\_use\_latest\_restore\_time](#input\_db\_use\_latest\_restore\_time) | Flag that indicates whether the DB instance is restored from the latest backup time. | `bool` | `null` | no |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | Username for the master database user. | `string` | `null` | no |
| <a name="input_egress_cidr_blocks"></a> [egress\_cidr\_blocks](#input\_egress\_cidr\_blocks) | Egress CIDR block for the RDS security group. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_egress_from_port"></a> [egress\_from\_port](#input\_egress\_from\_port) | Starting egress port for the RDS security group. | `number` | `3306` | no |
| <a name="input_egress_protocol"></a> [egress\_protocol](#input\_egress\_protocol) | Egress protocol for the port defined in the RDS security group. | `string` | `"tcp"` | no |
| <a name="input_egress_to_port"></a> [egress\_to\_port](#input\_egress\_to\_port) | Ending egress port for the RDS security group. | `number` | `3306` | no |
| <a name="input_final_snapshot_prefix"></a> [final\_snapshot\_prefix](#input\_final\_snapshot\_prefix) | The name which is prefixed to the final snapshot on database termination. | `string` | `"mysql-snap-"` | no |
| <a name="input_ingress_cidr_blocks"></a> [ingress\_cidr\_blocks](#input\_ingress\_cidr\_blocks) | Ingress CIDR block for the RDS security group. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_ingress_from_port"></a> [ingress\_from\_port](#input\_ingress\_from\_port) | Starting ingress port for the RDS security group. | `number` | `3306` | no |
| <a name="input_ingress_protocol"></a> [ingress\_protocol](#input\_ingress\_protocol) | Ingress protocol for the port defined in the RDS security group. | `string` | `"tcp"` | no |
| <a name="input_ingress_to_port"></a> [ingress\_to\_port](#input\_ingress\_to\_port) | Ending ingress port for the RDS security group. | `number` | `3306` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | Instance class that will be used by the RDS instance. | `string` | `"db.m6i.2xlarge"` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN. | `string` | `null` | no |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | Flag that specifies if the RDS instance is multi\_az. | `bool` | `true` | no |
| <a name="input_rds_identifier"></a> [rds\_identifier](#input\_rds\_identifier) | Name of the RDS instance that will be created. | `string` | n/a | yes |
| <a name="input_rds_security_group_tag"></a> [rds\_security\_group\_tag](#input\_rds\_security\_group\_tag) | Map of tags for the RDS security group. | `map(string)` | <pre>{<br>  "Name": "mysql_rds"<br>}</pre> | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of existing AWS security groups that will be attached to the RDS instance. | `list(string)` | `null` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Flag to indicate whether a final snapshot will be skipped upon database termination. | `bool` | `false` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID within which the database resource will be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_allocated_storage"></a> [db\_allocated\_storage](#output\_db\_allocated\_storage) | Storage that was allocated to the instance when it configured. |
| <a name="output_db_arn"></a> [db\_arn](#output\_db\_arn) | ARN of the database instance. |
| <a name="output_db_automated_backup_arn"></a> [db\_automated\_backup\_arn](#output\_db\_automated\_backup\_arn) | The ARN of the automated backup from which to restore. |
| <a name="output_db_backup_retention"></a> [db\_backup\_retention](#output\_db\_backup\_retention) | Number of configured backups to keep for the database instance. |
| <a name="output_db_backup_window"></a> [db\_backup\_window](#output\_db\_backup\_window) | Configured backup window for the database instance. |
| <a name="output_db_ca_cert_identifier"></a> [db\_ca\_cert\_identifier](#output\_db\_ca\_cert\_identifier) | The identifier of the CA certificate for the DB instance. |
| <a name="output_db_custom_iam_profile"></a> [db\_custom\_iam\_profile](#output\_db\_custom\_iam\_profile) | The instance profile associated with the underlying Amazon EC2 instance of an RDS Custom DB instance. |
| <a name="output_db_delete_automated_backups"></a> [db\_delete\_automated\_backups](#output\_db\_delete\_automated\_backups) | Flag that specifies if automated backups are deleted. |
| <a name="output_db_domain_iam_role"></a> [db\_domain\_iam\_role](#output\_db\_domain\_iam\_role) | The name of the IAM role to be used when making API calls to the Directory Service. |
| <a name="output_db_encryption"></a> [db\_encryption](#output\_db\_encryption) | Flag that indicates if storage encryption is enabled. |
| <a name="output_db_endpoint"></a> [db\_endpoint](#output\_db\_endpoint) | Connection endpoint for the database instance that has been created. |
| <a name="output_db_engine"></a> [db\_engine](#output\_db\_engine) | Database instance engine that was configured. |
| <a name="output_db_engine_version_actual"></a> [db\_engine\_version\_actual](#output\_db\_engine\_version\_actual) | Running engine version of the database (full version number) |
| <a name="output_db_final_snapshot_identifier"></a> [db\_final\_snapshot\_identifier](#output\_db\_final\_snapshot\_identifier) | Final snapshot identifier for the database instance. |
| <a name="output_db_hosted_zone_id"></a> [db\_hosted\_zone\_id](#output\_db\_hosted\_zone\_id) | Hosted zone ID for the database instance. |
| <a name="output_db_hostname"></a> [db\_hostname](#output\_db\_hostname) | Database instance hostname. |
| <a name="output_db_iam_auth_enabled"></a> [db\_iam\_auth\_enabled](#output\_db\_iam\_auth\_enabled) | Flag that specifies if iam authenticaiton is enabled on the database |
| <a name="output_db_instance_id"></a> [db\_instance\_id](#output\_db\_instance\_id) | RDS instance ID. |
| <a name="output_db_iops"></a> [db\_iops](#output\_db\_iops) | Database instance iops that was configured. |
| <a name="output_db_kms_key_id"></a> [db\_kms\_key\_id](#output\_db\_kms\_key\_id) | KMS key that is configured on the database instance if storage encryption is enabled. |
| <a name="output_db_latest_restore_time"></a> [db\_latest\_restore\_time](#output\_db\_latest\_restore\_time) | Latest available restorable time for the database instance. |
| <a name="output_db_maintenance_window"></a> [db\_maintenance\_window](#output\_db\_maintenance\_window) | Maintainence window for the database instance. |
| <a name="output_db_max_allocated_storage"></a> [db\_max\_allocated\_storage](#output\_db\_max\_allocated\_storage) | Maximum storage allocation that is configured on the database instance. |
| <a name="output_db_monitoring_interval"></a> [db\_monitoring\_interval](#output\_db\_monitoring\_interval) | Monitoring interval configuration. |
| <a name="output_db_name"></a> [db\_name](#output\_db\_name) | Name of the database that was created (if specified) during instance creation. |
| <a name="output_db_parameter_group"></a> [db\_parameter\_group](#output\_db\_parameter\_group) | Parameter group that was created |
| <a name="output_db_password"></a> [db\_password](#output\_db\_password) | Database instance master password. |
| <a name="output_db_performance_insights"></a> [db\_performance\_insights](#output\_db\_performance\_insights) | Flag that indiciates if Performance Insights is enabled. |
| <a name="output_db_performance_insights_kms_key_id"></a> [db\_performance\_insights\_kms\_key\_id](#output\_db\_performance\_insights\_kms\_key\_id) | ARN of the KMS key that Performance Insights is utilizing (if enabled). |
| <a name="output_db_performance_insights_retention_period"></a> [db\_performance\_insights\_retention\_period](#output\_db\_performance\_insights\_retention\_period) | Data retention period for Performance Insights (if enabled). |
| <a name="output_db_port"></a> [db\_port](#output\_db\_port) | Database instance port. |
| <a name="output_db_restore_time"></a> [db\_restore\_time](#output\_db\_restore\_time) | The date and time to restore from. |
| <a name="output_db_security_group"></a> [db\_security\_group](#output\_db\_security\_group) | Security Group that was created (if specified) during the run. |
| <a name="output_db_security_group_ids"></a> [db\_security\_group\_ids](#output\_db\_security\_group\_ids) | Security Group IDs that were associated with the database instance. |
| <a name="output_db_source_db_instance_id"></a> [db\_source\_db\_instance\_id](#output\_db\_source\_db\_instance\_id) | The identifier of the source DB instance from which to restore. |
| <a name="output_db_source_dbi_resource_id"></a> [db\_source\_dbi\_resource\_id](#output\_db\_source\_dbi\_resource\_id) | The resource ID of the source DB instance from which to restore. |
| <a name="output_db_status"></a> [db\_status](#output\_db\_status) | Status of the database instance that was created. |
| <a name="output_db_storage_type"></a> [db\_storage\_type](#output\_db\_storage\_type) | Storage type that is configured on the database instance. |
| <a name="output_db_subnet_group"></a> [db\_subnet\_group](#output\_db\_subnet\_group) | Name of the subnet group that is associated with the database instance. |
| <a name="output_db_username"></a> [db\_username](#output\_db\_username) | Database instance master username. |
| <a name="output_instance_class"></a> [instance\_class](#output\_instance\_class) | Instance class in use for the database instance that was created. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

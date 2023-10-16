########################
####     Intel      ####
########################

# See policies.md, we recommend  Intel Xeon 3rd Generation Scalable processors (code-named Ice Lake)
# General Purpose: db.m6i.large, db.m6i.xlarge, db.m6i.2xlarge, db.m6i.4xlarge, db.m6i.8xlarge, db.m6i.12xlarge, db.m6i.16xlarge, db.m6i.24xlarge, db.m6i.32xlarge
# Memory Optimized: db.r6i.large, db.r6i.xlarge, db.r6i.2xlarge, db.r6i.4xlarge, db.r6i.8xlarge, db.r6i.12xlarge, db.r6i.16xlarge, db.r6i.24xlarge, db.r6i.32xlarge
# See more:
# https://aws.amazon.com/ec2/instance-types/m6i/
# https://aws.amazon.com/ec2/instance-types/r6i/
# https://aws.amazon.com/rds/mysql/pricing/

variable "instance_class" {
  type        = string
  description = "Instance class that will be used by the RDS instance."
  default     = "db.m6i.2xlarge"
}

variable "db_parameters" {
  type = object({
    mysql = object({
      table_open_cache = optional(object({
        value        = optional(string, "8000")
        apply_method = optional(string, "immediate")
      }))
      table_open_cache_instances = optional(object({
        value        = optional(string, "16")
        apply_method = optional(string, "pending-reboot")
      }))
      max_connections = optional(object({
        value        = optional(string, "4000")
        apply_method = optional(string, "immediate")
      }))
      back_log = optional(object({
        value        = optional(string, "1500")
        apply_method = optional(string, "pending-reboot")
      }))
      default_password_lifetime = optional(object({
        value        = optional(string, "0")
        apply_method = optional(string, "pending-reboot")
      }))
      performance_schema = optional(object({
        value        = optional(string, "0")
        apply_method = optional(string, "pending-reboot")
      }))
      max_prepared_stmt_count = optional(object({
        value        = optional(string, "128000")
        apply_method = optional(string, "immediate")
      }))
      character_set_server = optional(object({
        value        = optional(string, "latin1")
        apply_method = optional(string, "immediate")
      }))
      collation_server = optional(object({
        value        = optional(string, "latin1_swedish_ci")
        apply_method = optional(string, "immediate")
      }))
      transaction_isolation = optional(object({
        value        = optional(string, "REPEATABLE-READ")
        apply_method = optional(string, "immediate")
      }))
      innodb_log_file_size = optional(object({
        value        = optional(string, 1024 * 1024 * 1024)
        apply_method = optional(string, "pending-reboot")
      }))
      innodb_open_files = optional(object({
        value        = optional(string, "4000")
        apply_method = optional(string, "pending-reboot")
      }))
      innodb_file_per_table = optional(object({
        value        = optional(string, "1")
        apply_method = optional(string, "pending-reboot")
      }))
      innodb_buffer_pool_instances = optional(object({
        value        = optional(string, "16")
        apply_method = optional(string, "pending-reboot")
      }))
      innodb_buffer_pool_size = optional(object({
        value        = optional(string, "64424509440") # 60 Gigabytes #Calculator https://convertlive.com/u/convert/gigabytes/to/bytes
        apply_method = optional(string, "pending-reboot")
      }))
      innodb_log_buffer_size = optional(object({
        value        = optional(string, "67108864")
        apply_method = optional(string, "pending-reboot")
      }))
      innodb_thread_concurrency = optional(object({
        value        = optional(string, "0")
        apply_method = optional(string, "immediate")
      }))
      innodb_flush_log_at_trx_commit = optional(object({
        value        = optional(string, "0")
        apply_method = optional(string, "immediate")
      }))
      innodb_max_dirty_pages_pct = optional(object({
        value        = optional(string, "90")
        apply_method = optional(string, "immediate")
      }))
      innodb_max_dirty_pages_pct_lwm = optional(object({
        value        = optional(string, "10")
        apply_method = optional(string, "immediate")
      }))
      join_buffer_size = optional(object({
        value        = optional(string, 32 * 1024)
        apply_method = optional(string, "immediate")
      }))
      sort_buffer_size = optional(object({
        value        = optional(string, 32 * 1024)
        apply_method = optional(string, "immediate")
      }))
      innodb_use_native_aio = optional(object({
        value        = optional(string, "1")
        apply_method = optional(string, "pending-reboot")
      }))
      innodb_stats_persistent = optional(object({
        value        = optional(string, "ON")
        apply_method = optional(string, "immediate")
      }))
      innodb_spin_wait_delay = optional(object({
        value        = optional(string, "6")
        apply_method = optional(string, "immediate")
      }))
      innodb_max_purge_lag_delay = optional(object({
        value        = optional(string, "300000")
        apply_method = optional(string, "immediate")
      }))
      innodb_max_purge_lag = optional(object({
        value        = optional(string, "0")
        apply_method = optional(string, "immediate")
      }))
      innodb_checksum_algorithm = optional(object({
        value        = optional(string, "none")
        apply_method = optional(string, "immediate")
      }))
      innodb_io_capacity = optional(object({
        value        = optional(string, "4000")
        apply_method = optional(string, "immediate")
      }))
      innodb_io_capacity_max = optional(object({
        value        = optional(string, "20000")
        apply_method = optional(string, "immediate")
      }))
      innodb_lru_scan_depth = optional(object({
        value        = optional(string, "9000")
        apply_method = optional(string, "immediate")
      }))
      innodb_change_buffering = optional(object({
        value        = optional(string, "none")
        apply_method = optional(string, "immediate")
      }))
      innodb_page_cleaners = optional(object({
        value        = optional(string, "4")
        apply_method = optional(string, "pending-reboot")
      }))
      innodb_undo_log_truncate = optional(object({
        value        = optional(string, "0")
        apply_method = optional(string, "pending-reboot")
      }))
      innodb_adaptive_flushing = optional(object({
        value        = optional(string, "1")
        apply_method = optional(string, "immediate")
      }))
      innodb_flush_neighbors = optional(object({
        value        = optional(string, "0")
        apply_method = optional(string, "immediate")
      }))
      innodb_read_io_threads = optional(object({
        value        = optional(string, "16")
        apply_method = optional(string, "pending-reboot")
      }))
      innodb_write_io_threads = optional(object({
        value        = optional(string, "16")
        apply_method = optional(string, "pending-reboot")
      }))
      innodb_purge_threads = optional(object({
        value        = optional(string, "4")
        apply_method = optional(string, "pending-reboot")
      }))
      innodb_adaptive_hash_index = optional(object({
        value        = optional(string, "0")
        apply_method = optional(string, "immediate")
      }))
    })
  })
  default = {
    mysql = {
      back_log                       = {}
      character_set_server           = {}
      collation_server               = {}
      default_password_lifetime      = {}
      innodb_adaptive_flushing       = {}
      innodb_adaptive_hash_index     = {}
      innodb_buffer_pool_instances   = {}
      innodb_buffer_pool_size        = {}
      innodb_change_buffering        = {}
      innodb_checksum_algorithm      = {}
      innodb_file_per_table          = {}
      innodb_flush_log_at_trx_commit = {}
      innodb_flush_neighbors         = {}
      innodb_io_capacity             = {}
      innodb_io_capacity_max         = {}
      innodb_log_buffer_size         = {}
      innodb_log_file_size           = {}
      innodb_lru_scan_depth          = {}
      innodb_max_dirty_pages_pct     = {}
      innodb_max_dirty_pages_pct_lwm = {}
      innodb_max_purge_lag           = {}
      innodb_max_purge_lag_delay     = {}
      innodb_open_files              = {}
      innodb_page_cleaners           = {}
      innodb_purge_threads           = {}
      innodb_read_io_threads         = {}
      innodb_spin_wait_delay         = {}
      innodb_stats_persistent        = {}
      innodb_thread_concurrency      = {}
      innodb_undo_log_truncate       = {}
      innodb_use_native_aio          = {}
      innodb_write_io_threads        = {}
      join_buffer_size               = {}
      max_connections                = {}
      max_prepared_stmt_count        = {}
      performance_schema             = {}
      sort_buffer_size               = {}
      table_open_cache               = {}
      table_open_cache_instances     = {}
      transaction_isolation          = {}
    }
  }
  description = "Intel Cloud optimizations for Xeon processors"
}

########################
####    Required    ####
########################

variable "vpc_id" {
  description = "VPC ID within which the database resource will be created."
  type        = string
}

variable "db_password" {
  description = "Password for the master database user."
  type        = string
  sensitive   = true
  validation {
    condition     = length(var.db_password) >= 8
    error_message = "The db_password value must be at least 8 characters in length."
  }
}

variable "rds_identifier" {
  description = "Name of the RDS instance that will be created."
  type        = string
}

########################
####     Other      ####
########################

variable "db_subnet_group_name" {
  description = "Database subnet group name."
  type        = string
  default     = null
}

variable "db_subnet_group_tag" {
  description = "Tag for the database subnet group."
  type        = map(string)
  default = {
    "Name" = "mysql"
  }
}

variable "db_parameter_group_name" {
  description = "Name for the RDS database parameter group."
  type        = string
  default     = "mysql"
}

variable "db_parameter_group_family" {
  description = "Family identifier for the RDS database parameter group."
  type        = string
  default     = "mysql8.0"
}

variable "db_name" {
  description = "Name of the database that will be created on the RDS instance. If this is specified then a database will be created as a part of the instance provisioning process."
  type        = string
  default     = null
}

variable "db_username" {
  description = "Username for the master database user."
  type        = string
  sensitive   = false
  default     = null
}

variable "db_port" {
  description = "The port on which the DB accepts connections."
  type        = number
  default     = null
}

variable "db_engine_version" {
  description = "Database engine version for AWS database instance."
  type        = string
  default     = "8.0"
}

variable "db_engine" {
  description = "Database engine version for AWS database instance."
  type        = string
  validation {
    condition     = contains(["mysql"], var.db_engine)
    error_message = "The db_engine must be \"mysql\"."
  }
  default = "mysql"
}

variable "db_option_group" {
  type        = string
  description = "Option group name to associate with the database instance."
  default     = null
}

variable "availability_zone" {
  description = "Availability zone where the RDS instance will be instantiated."
  type        = string
  default     = null
}

variable "multi_az" {
  description = "Flag that specifies if the RDS instance is multi_az."
  type        = bool
  default     = true
}

variable "db_tags" {
  description = "Map of tags to apply to the database instance."
  type        = map(string)
  default     = null
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of existing AWS security groups that will be attached to the RDS instance."
  default     = null
}

variable "db_ca_cert_identifier" {
  type        = string
  description = "The identifier of the CA certificate for the DB instance."
  default     = null
}

## Snapshots
variable "skip_final_snapshot" {
  description = "Flag to indicate whether a final snapshot will be skipped upon database termination."
  type        = bool
  default     = false
}

variable "final_snapshot_prefix" {
  description = "The name which is prefixed to the final snapshot on database termination."
  type        = string
  default     = "mysql-snap-"
}

variable "db_storage_type" {
  description = "The storage type that will be set on the instance. If db_iops is set then this will be set to io1"
  type        = string
  validation {
    condition     = contains(["standard", "gp2", "io1"], var.db_storage_type)
    error_message = "The db_storage_type must be one of the following: \"standard\", \"gp2\", \"io1\"."
  }
  default = "io1"
}

variable "db_allocated_storage" {
  description = "Allocated storage for AWS database instance."
  type        = number
  default     = 200
}

variable "db_max_allocated_storage" {
  description = "When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated_storage. Must be greater than or equal to allocated_storage or 0 to disable Storage Autoscaling."
  type        = number
  default     = 10000
}

variable "db_iops" {
  description = "The amount of provisioned IOPS. Setting this implies a storage_type of io1."
  type        = number
  default     = 10000
}

variable "db_apply_immediately" {
  description = "Flag that specifies whether any database modifications are applied immediately, or during the next maintenance window."
  type        = bool
  default     = false
}

variable "auto_minor_version_upgrades" {
  description = "Flag that specifies if minor engine upgrades will be applied automatically to the DB instance during the maintenance window."
  type        = bool
  default     = true
}

variable "auto_major_version_upgrades" {
  description = "Flag that specifices if major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible."
  type        = bool
  default     = false
}

variable "db_maintenance_window" {
  type        = string
  description = "The window to perform maintenance in. Syntax: ddd:hh24:mi-ddd:hh24:mi"
  default     = null
}

variable "db_publicly_accessible" {
  description = "Flag to indicate whether the database will be publicly accessible."
  type        = bool
  default     = false
}

variable "kms_key_id" {
  type        = string
  description = "The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN."
  default     = null
}

variable "db_encryption" {
  description = "Flag that specifies whether the DB instance is encrypted."
  type        = bool
  default     = true
}

# Monitoring
variable "db_monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance"
  type        = string
  validation {
    condition     = contains(["0", "1", "5", "10", "15", "30", "60"], var.db_monitoring_interval)
    error_message = "The db_monitoring_interval must be one of the following: 0, 1, 5, 10, 15, 30, 60."
  }
  default = 0
}

variable "db_monitoring_role_arn" {
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs"
  type        = string
  default     = null
}

variable "db_cloudwatch_logs_export" {
  description = "Set of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported."
  type        = list(string)
  default     = []
}

variable "db_performance_insights" {
  description = "Flag that specifies whether Performance Insights are enabled."
  type        = bool
  default     = false
}

variable "db_performance_insights_kms_key_id" {
  description = "The ARN for the KMS key to encrypt Performance Insights data."
  type        = string
  default     = null
}

variable "db_performance_retention_period" {
  description = "Amount of time in days to retain Performance Insights data.Valid values are 7, 731 (2 years) or a multiple of 31."
  type        = string
  default     = null
}

variable "db_domain" {
  description = "The ID of the Directory Service Active Directory domain to create the instance in."
  type        = string
  default     = null
}

variable "db_snapshot_identifier" {
  description = "Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console."
  type        = string
  default     = null
}

variable "db_domain_iam_role" {
  description = "(Required if db_domain is provided) The name of the IAM role to be used when making API calls to the Directory Service."
  type        = string
  default     = null
}

variable "db_custom_iam_profile" {
  description = "(The instance profile associated with the underlying Amazon EC2 instance of an RDS Custom DB instance."
  type        = string
  default     = null
}

variable "db_iam_authentication" {
  description = "Flag that specifies whether mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled."
  type        = bool
  default     = false
}

variable "db_replicate_source_db" {
  description = "Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate (if replicating within a single region) or ARN of the Amazon RDS Database to replicate (if replicating cross-region). Note that if you are creating a cross-region replica of an encrypted database you will also need to specify a kms_key_id."
  type        = string
  default     = null
}

variable "db_timeouts" {
  type = object({
    create = optional(string, null)
    delete = optional(string, null)
    update = optional(string, null)
  })
  description = "Map of timeouts that can be adjusted when executing the module. This allows you to customize how long certain operations are allowed to take before being considered to have failed."
  default = {
    db_timeouts = {}
  }
}

variable "db_restore_time" {
  description = "The date and time to restore from. Value must be a time in Universal Coordinated Time (UTC) format and must be before the latest restorable time for the DB instance."
  type        = string
  default     = null
}

variable "db_source_dbi_resource_id" {
  description = "The resource ID of the source DB instance from which to restore. Required if source_db_instance_identifier or source_db_instance_automated_backups_arn is not specified."
  type        = string
  default     = null
}

variable "db_source_db_instance_id" {
  description = "The identifier of the source DB instance from which to restore. Must match the identifier of an existing DB instance. Required if source_db_instance_automated_backups_arn or source_dbi_resource_id is not specified."
  type        = string
  default     = null
}

variable "db_automated_backup_arn" {
  description = "The ARN of the automated backup from which to restore. Required if source_db_instance_identifier or source_dbi_resource_id is not specified."
  type        = string
  default     = null
}

variable "db_use_latest_restore_time" {
  description = "Flag that indicates whether the DB instance is restored from the latest backup time."
  type        = bool
  default     = null
}

variable "db_backup_retention_period" {
  description = "The days to retain backups for. Must be between 0 and 35. Must be greater than 0 if the database is used as a source for a Read Replica."
  type        = number
  validation {
    condition     = var.db_backup_retention_period >= 0 && var.db_backup_retention_period <= 35
    error_message = "The db_backup_retention_period must be between 0 and 35."
  }
  default = 7
}

variable "db_backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: `09:46-10:16.` Must not overlap with maintenance_window."
  type        = string
  default     = null
}

variable "db_deletion_protection" {
  description = "Flag that specifies whether the DB instance is protected from deletion."
  type        = bool
  default     = false
}

variable "aws_security_group_name" {
  description = "security group name for the rds"
  type        = string
  default     = "mysql_rds"
}

variable "ingress_from_port" {
  description = "Starting ingress port for the RDS security group."
  type        = number
  default     = 3306
}

variable "ingress_to_port" {
  description = "Ending ingress port for the RDS security group."
  type        = number
  default     = 3306
}

variable "ingress_protocol" {
  description = "Ingress protocol for the port defined in the RDS security group."
  type        = string
  default     = "tcp"
}

variable "ingress_cidr_blocks" {
  description = "Ingress CIDR block for the RDS security group."
  type        = list(string)

  # CIDR block for allowed incoming connection to the database. The default value is open to the world.
  # Change it as needed before connecting to the database
  default = ["0.0.0.0/0"]
}

variable "egress_from_port" {
  description = "Starting egress port for the RDS security group."
  type        = number
  default     = 3306
}

variable "egress_to_port" {
  description = "Ending egress port for the RDS security group."
  type        = number
  default     = 3306
}

variable "egress_protocol" {
  description = "Egress protocol for the port defined in the RDS security group."
  type        = string
  default     = "tcp"
}

variable "egress_cidr_blocks" {
  description = "Egress CIDR block for the RDS security group."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "rds_security_group_tag" {
  description = "Map of tags for the RDS security group."
  type        = map(string)
  default = {
    "Name" = "mysql_rds"
  }
}

variable "create_security_group" {
  type        = bool
  description = "Flag that allows for the creation of a security group that allows access to the instance. Please use this for non-production use cases only."
  default     = false
}

variable "create_subnet_group" {
  type        = bool
  description = "Flag that allows for the creation of a subnet group that allows public access."
  default     = true
}
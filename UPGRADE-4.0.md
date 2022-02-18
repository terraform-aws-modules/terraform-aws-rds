# Upgrade from v3.x to v4.x

If you have any questions regarding this upgrade process, please consult the [`examples/`](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/examples) projects:

If you find a bug, please open an issue with supporting configuration to reproduce.

## List of backwards incompatible changes

- Support for Terraform `<=v0.12.x` has been dropped; `v0.13.1` is now the minimum supported version
- Terraform AWS provider minimum version is now `v4.0.0` in order to support the replacement of `var.name`(deprecated) for `var.db_name`
- Separate RDS instance resource for MSSQL/SQLServer has been removed - all engines are supported under one resource
- `storage_encrypted` is now set to `true` by default; was previously `false`
- `create_random_password` is now set to `true` by default; was previously `false`
- `create_db_subnet_group` is now set to `false` by default; was previously `true`; typically a shared DB subnet group will be used, most likely from the VPC module
- `random_password_length` is now set to `16` by default, was previously `10`
- Random provider minimum version supported is now `v3.1.0`
- `final_snapshot_identifier` no longer coalesces `var.final_snapshot_identifier` and instead relies on `var.final_snapshot_identifier_prefix` with a random suffix to avoid name collisions

## Additional changes

### Added

- `latest_restorable_time` added to ignored changes
- `replica_mode` support added to DB instance

### Modified

- `username`, `password`, and `engine` are set to `null` when  a `replicate_source_db` or `snapshot_identifier` is provided; these values are already provided in the respective source
- `engine_version` is set to `null` when a value is provided for `replicate_source_db`
- `db_subnet_group_name` has been updated to use full name when prefix is enabled
- `Name` tag removed from instance resource; name is set via `identifier` and not through tags; users can add back into the tags they provide if desired
- Outputs have been updated to use `try()` syntax; local variable usage has been removed within outputs
- `engine`, `major_engine_version`, `family`, `password`, `db_subnet_group_name`,`db_subnet_group_description`,`parameter_group_name`,
`parameter_group_description`, `option_group_name`, `option_group_description` is now set to `null` by default; was previously `""`
- `timeouts` is now set to `{}` by default; was previously a copy+paste of default value used by provider. This is a no-op but will show up in plans as a diff

### Variable and output changes

1. Removed variables:

    - `final_snapshot_identifier`

2. Renamed variables:

    - `name` (deprecated) -> `db_name`
    - `master_password` -> `password`

3. Added variables:

    - `replica_mode`

4. Removed outputs:

    - None

5. Renamed outputs:

    - `db_instance_master_password` -> `db_instance_password`

6. Added outputs:

    - None

## Upgrade Migrations

The following examples demonstrate some of the changes that users can elect to make to avoid any potential disruptions when upgrading.

### Before 3.x Example

```hcl
module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 3.0"

  master_password = "MySuperStrongPassword!"

  # Previously on read-replicas or restored from snapshot instances you needed to explicitly set these to null
  # These can now be safely removed and instead on the module to resolve these appropriately
  username = null
  password = null
  engine   = null
}
```

### After 4.x Example

```hcl
module "asg" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 4.0"

  password               = "MySuperStrongPassword!"
  # Set random password creation to false if providing your own password as input
  create_random_password = false

  # If you did not have storage encrypted in `v3.x`, you can explicitly disable in `v4.x` to avoid disruption
  storage_encrypted = false
}
```

#### MSSQL/SQLServer

For MSSSQL/SQLServer, users will want to rename the resource in their Terraform state to align with the flattened DB instance resource module in v4.x:

```bash
terraform state mv 'module.<module-name>.module.db_instance.aws_db_instance.this_mssql[0]' 'module.<module-name>.module.db_instance.aws_db_instance.this[0]'
```

Where `<module-name>` is the name of your module definition.

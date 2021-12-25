# Upgrade from v3.x to v4.x

If you have any questions regarding this upgrade process, please consult the [`examples/`](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/examples) projects:

If you find a bug, please open an issue with supporting configuration to reproduce.

## List of backwards incompatible changes

- Support for Terraform <=v0.12.x has been dropped; v0.13.1 is now the minimum supported version
- `storage_encrypted` is now set to `true` by default; was previously `false`
- `create_random_password` is now set to `true` by default; was previously `false`
- `random_password_length` is now set to 16 by default, was previously 10

## Additional changes

### Added

- `latest_restorable_time` added to ignored changes
- `restore_to_point_in_time` attribute added to MSSQL instance

### Modified

- AWS provider minimum supported version raised to v3.62 to support new attribute added
- `password` is now set to `null` by default; was previously `""`
- Outputs updated to use `try()` function
- `username`, `password`, and `engine` are set to `null` when  a `replicate_source_db` or `snapshot_identifier` is provided; these values are already provided in the respective source
- `db_subnet_group_name` has been updated to use full name when prefix is enabled

### Variable and output changes

1. Removed variables:

    - None

2. Renamed variables:

    - None

3. Added variables:

    - `replica_mode`

4. Removed outputs:

    - None

5. Renamed outputs:

    - None

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

  master_password        = "MySuperStrongPassword!"
  # Set random password creation to false if providing your own password as input
  create_random_password = false

  # If you did not have storage encrypted in `v3.x`, you can explicitly disable in `v4.x` to avoid disruption
  storage_encrypted = false
}
```

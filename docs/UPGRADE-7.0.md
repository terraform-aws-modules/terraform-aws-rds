# Upgrade from v6.x to v7.x

If you have any questions regarding this upgrade process, please consult the `examples` directory.
If you find a bug, please open an issue with supporting configuration to reproduce.

## List of backwards incompatible changes

- Terraform `v1.11.1` is now minimum supported version to support write-only (`wo_*`) attributes.
- AWS provider `v6.27` is now minimum supported version
- `password` is no longer supported and only the write-only equivalent is supported (`password_wo` and `password_wo_version`)

## Additional changes

### Added

- Support for `region` argument to specify the AWS region for the resources created if different from the provider region.

### Modified

- Variable definitions now contain detailed object types in place of the previously used `any` type
- `copy_tags_to_snapshot` default value is now `true`

### Removed

- None

### Variable and output changes

1. Removed variables:

  - None

2. Renamed variables:

  - None

3. Added variables:

  - `region`

4. Removed outputs:

  - None

5. Renamed outputs:

  - None

6. Added outputs:

  - `db_instance_upgrade_rollout_order`

## Upgrade Migrations

### Before 7.x Example

```hcl
resource "random_password" "master_password" {
  length  = 16
  special = false
}

module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 6.0"

  # Only the affected attributes are shown
  password_wo         = random_password.master_password.result
  password_wo_version = 1
}
```

### After 7.x Example

```hcl
resource "random_password" "master_password" {
  length  = 16
  special = false
}

module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 7.0"

  # Only the affected attributes are shown
  master_password_wo         = random_password.master_password.result
  master_password_wo_version = 1
}
```

### State Changes

- None

# Upgrade from v5.x to v6.x

If you have any questions regarding this upgrade process, please consult the [`examples/`](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/examples) projects:

If you find a bug, please open an issue with supporting configuration to reproduce.

## List of backwards incompatible changes

With RDS now supporting the integration with SecretsManager to manage the master user password, the ability to generate a random password has been removed from this module. This is the preferred and strongly recommended route to mange the password since it keeps the password out of the Terraform state and allows for the password to be rotated automatically.

## Variable and output changes

1. Removed variables:

   - `create_random_password` -> support for random password generation has been removed
   - `random_password_length` -> support for random password generation has been removed

2. Renamed variables:

   - None

3. Added variables:

   - `manage_master_user_password`
   - `master_user_secret_kms_key_id`

4. Removed outputs:

   - `db_instance_password` -> support for random password generation has been removed


5. Renamed outputs:

   - `db_instance_id` -> `db_instance_identifier`

6. Added outputs:

   - None


## Upgrade Migrations

### Before 5.x Example

```hcl
module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 5.0"

  # Only the affected attributes are shown
  create_db_instance = true

  create_random_password = true
  random_password_length = 16

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
```

### After 6.x Example

```hcl
module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 6.0"

  create_db_instance = true

  manage_master_user_password = true

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
```

### Retaining use of random password

The following example demonstrates the changes that users can elect to make to avoid any potential disruptions when upgrading if electing not to use RDS password management with SecretsManager `manage_master_user_password` when previously using `create_random_password`.

In this example, the `random_password` resource is added alongside the existing module to preserve the existing password.

```hcl
resource "random_password" "master_password" {
  length  = 16
  special = false
}

module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 5.0"

  # Only the affected attributes are shown
  create_db_instance = true

  manage_master_user_password = false

  password = random_password.master_password.result

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
```

A state move must be done to preserve the previously used random password. Example:

```
terraform state mv 'module.rds.random_password.master_password[0]' random_password.master_password
```

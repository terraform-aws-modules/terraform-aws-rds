# Example usage of option groups

Configuration in this directory creates various option groups depending on the configuration specified - no other resources are created.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No provider.

## Modules

| Name | Source | Version |
|------|--------|---------|
| byo_mysql | ../../ |  |
| default_mysql | ../../ |  |
| default_mysql_name | ../../ |  |
| default_postgres | ../../ |  |

## Resources

No resources.

## Inputs

No input.

## Outputs

| Name | Description |
|------|-------------|
| byo\_mysql\_option\_group\_arn | The ARN of the BYO MySQL option group (should be blank) |
| byo\_mysql\_option\_group\_id | The ID of the BYO MySQL option group (should be blank) |
| default\_mysql\_name\_option\_group\_id | The ID of the default MySQL option group using `name` |
| default\_mysql\_option\_group\_arn | The ARN of the default MySQL option group using `name` |
| default\_mysql\_option\_group\_id | The ID of the default MySQL option group |
| default\_postgres\_option\_group\_arn | The ARN of the default PostgreSQL option group (should be blank) |
| default\_postgres\_option\_group\_id | The ID of the default PostgreSQL option group (should be blank) |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

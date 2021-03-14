# Example usage of option and parameter groups

Configuration in this directory creates various option and parameter groups depending on the configuration specified - no other resources are created.

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

| Name | Version |
|------|---------|
| terraform | >= 0.12.26 |
| aws | >= 2.49 |

## Providers

No provider.

## Modules

| Name | Source | Version |
|------|--------|---------|
| byo_mysql | ../../ |  |
| default_mysql | ../../ |  |
| default_mysql_default_aws | ../../ |  |
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
| byo\_mysql\_parameter\_group\_arn | The ARN of the db parameter group |
| byo\_mysql\_parameter\_group\_id | The db parameter group id |
| default\_mysql\_default\_aws\_option\_group\_arn | The ARN of the default MySQL option group |
| default\_mysql\_default\_aws\_option\_group\_id | The ID of the default MySQL option group |
| default\_mysql\_default\_aws\_parameter\_group\_arn | The ARN of the db parameter group |
| default\_mysql\_default\_aws\_parameter\_group\_id | The db parameter group id |
| default\_mysql\_name\_option\_group\_arn | The ARN of the default MySQL option group using `name` |
| default\_mysql\_name\_option\_group\_id | The ID of the default MySQL option group using `name` |
| default\_mysql\_name\_parameter\_group\_arn | The ARN of the db parameter group |
| default\_mysql\_name\_parameter\_group\_id | The db parameter group id |
| default\_mysql\_option\_group\_arn | The ARN of the default MySQL option group |
| default\_mysql\_option\_group\_id | The ID of the default MySQL option group |
| default\_mysql\_parameter\_group\_arn | The ARN of the db parameter group |
| default\_mysql\_parameter\_group\_id | The db parameter group id |
| default\_postgres\_option\_group\_arn | The ARN of the default PostgreSQL option group (should be blank) |
| default\_postgres\_option\_group\_id | The ID of the default PostgreSQL option group (should be blank) |
| default\_postgres\_parameter\_group\_arn | The ARN of the db parameter group |
| default\_postgres\_parameter\_group\_id | The db parameter group id |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

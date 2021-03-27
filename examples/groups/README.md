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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.49 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_byo_mysql"></a> [byo\_mysql](#module\_byo\_mysql) | ../../ |  |
| <a name="module_default_mysql"></a> [default\_mysql](#module\_default\_mysql) | ../../ |  |
| <a name="module_default_mysql_default_aws"></a> [default\_mysql\_default\_aws](#module\_default\_mysql\_default\_aws) | ../../ |  |
| <a name="module_default_mysql_name"></a> [default\_mysql\_name](#module\_default\_mysql\_name) | ../../ |  |
| <a name="module_default_postgres"></a> [default\_postgres](#module\_default\_postgres) | ../../ |  |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_byo_mysql_option_group_arn"></a> [byo\_mysql\_option\_group\_arn](#output\_byo\_mysql\_option\_group\_arn) | The ARN of the BYO MySQL option group (should be blank) |
| <a name="output_byo_mysql_option_group_id"></a> [byo\_mysql\_option\_group\_id](#output\_byo\_mysql\_option\_group\_id) | The ID of the BYO MySQL option group (should be blank) |
| <a name="output_byo_mysql_parameter_group_arn"></a> [byo\_mysql\_parameter\_group\_arn](#output\_byo\_mysql\_parameter\_group\_arn) | The ARN of the db parameter group |
| <a name="output_byo_mysql_parameter_group_id"></a> [byo\_mysql\_parameter\_group\_id](#output\_byo\_mysql\_parameter\_group\_id) | The db parameter group id |
| <a name="output_default_mysql_default_aws_option_group_arn"></a> [default\_mysql\_default\_aws\_option\_group\_arn](#output\_default\_mysql\_default\_aws\_option\_group\_arn) | The ARN of the default MySQL option group |
| <a name="output_default_mysql_default_aws_option_group_id"></a> [default\_mysql\_default\_aws\_option\_group\_id](#output\_default\_mysql\_default\_aws\_option\_group\_id) | The ID of the default MySQL option group |
| <a name="output_default_mysql_default_aws_parameter_group_arn"></a> [default\_mysql\_default\_aws\_parameter\_group\_arn](#output\_default\_mysql\_default\_aws\_parameter\_group\_arn) | The ARN of the db parameter group |
| <a name="output_default_mysql_default_aws_parameter_group_id"></a> [default\_mysql\_default\_aws\_parameter\_group\_id](#output\_default\_mysql\_default\_aws\_parameter\_group\_id) | The db parameter group id |
| <a name="output_default_mysql_name_option_group_arn"></a> [default\_mysql\_name\_option\_group\_arn](#output\_default\_mysql\_name\_option\_group\_arn) | The ARN of the default MySQL option group using `name` |
| <a name="output_default_mysql_name_option_group_id"></a> [default\_mysql\_name\_option\_group\_id](#output\_default\_mysql\_name\_option\_group\_id) | The ID of the default MySQL option group using `name` |
| <a name="output_default_mysql_name_parameter_group_arn"></a> [default\_mysql\_name\_parameter\_group\_arn](#output\_default\_mysql\_name\_parameter\_group\_arn) | The ARN of the db parameter group |
| <a name="output_default_mysql_name_parameter_group_id"></a> [default\_mysql\_name\_parameter\_group\_id](#output\_default\_mysql\_name\_parameter\_group\_id) | The db parameter group id |
| <a name="output_default_mysql_option_group_arn"></a> [default\_mysql\_option\_group\_arn](#output\_default\_mysql\_option\_group\_arn) | The ARN of the default MySQL option group |
| <a name="output_default_mysql_option_group_id"></a> [default\_mysql\_option\_group\_id](#output\_default\_mysql\_option\_group\_id) | The ID of the default MySQL option group |
| <a name="output_default_mysql_parameter_group_arn"></a> [default\_mysql\_parameter\_group\_arn](#output\_default\_mysql\_parameter\_group\_arn) | The ARN of the db parameter group |
| <a name="output_default_mysql_parameter_group_id"></a> [default\_mysql\_parameter\_group\_id](#output\_default\_mysql\_parameter\_group\_id) | The db parameter group id |
| <a name="output_default_postgres_option_group_arn"></a> [default\_postgres\_option\_group\_arn](#output\_default\_postgres\_option\_group\_arn) | The ARN of the default PostgreSQL option group (should be blank) |
| <a name="output_default_postgres_option_group_id"></a> [default\_postgres\_option\_group\_id](#output\_default\_postgres\_option\_group\_id) | The ID of the default PostgreSQL option group (should be blank) |
| <a name="output_default_postgres_parameter_group_arn"></a> [default\_postgres\_parameter\_group\_arn](#output\_default\_postgres\_parameter\_group\_arn) | The ARN of the db parameter group |
| <a name="output_default_postgres_parameter_group_id"></a> [default\_postgres\_parameter\_group\_id](#output\_default\_postgres\_parameter\_group\_id) | The db parameter group id |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

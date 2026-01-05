# aws_db_option_group

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.11.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.27 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 6.27 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_option_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_option_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input\_create) | Whether to create this resource or not? | `bool` | `true` | no |
| <a name="input_engine_name"></a> [engine\_name](#input\_engine\_name) | Specifies the name of the engine that this option group should be associated with | `string` | `null` | no |
| <a name="input_major_engine_version"></a> [major\_engine\_version](#input\_major\_engine\_version) | Specifies the major version of the engine that this option group should be associated with | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the option group | `string` | `""` | no |
| <a name="input_option_group_description"></a> [option\_group\_description](#input\_option\_group\_description) | The description of the option group | `string` | `null` | no |
| <a name="input_options"></a> [options](#input\_options) | A list of Options to apply | <pre>list(object({<br/>    option_name                    = string<br/>    port                           = optional(number)<br/>    version                        = optional(string)<br/>    db_security_group_memberships  = optional(list(string))<br/>    vpc_security_group_memberships = optional(list(string))<br/>    option_settings = optional(list(object({<br/>      name  = string<br/>      value = string<br/>    })))<br/>  }))</pre> | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | Region where this resource will be managed. Defaults to the Region set in the provider configuration | `string` | `null` | no |
| <a name="input_skip_destroy"></a> [skip\_destroy](#input\_skip\_destroy) | Set to true if you do not wish the option group to be deleted at destroy time, and instead just remove the option group from the Terraform state | `bool` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | Define maximum timeout for deletion of `aws_db_option_group` resource | <pre>object({<br/>    delete = optional(string)<br/>  })</pre> | `null` | no |
| <a name="input_use_name_prefix"></a> [use\_name\_prefix](#input\_use\_name\_prefix) | Determines whether to use `name` as is or create a unique name beginning with `name` as the specified prefix | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_option_group_arn"></a> [db\_option\_group\_arn](#output\_db\_option\_group\_arn) | The ARN of the db option group |
| <a name="output_db_option_group_id"></a> [db\_option\_group\_id](#output\_db\_option\_group\_id) | The db option group id |
<!-- END_TF_DOCS -->

# aws_db_option_group

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create | Whether to create this resource or not? | `bool` | `true` | no |
| engine\_name | Specifies the name of the engine that this option group should be associated with | `string` | n/a | yes |
| identifier | The identifier of the resource | `string` | n/a | yes |
| major\_engine\_version | Specifies the major version of the engine that this option group should be associated with | `string` | n/a | yes |
| name\_prefix | Creates a unique name beginning with the specified prefix | `string` | n/a | yes |
| option\_group\_description | The description of the option group | `string` | `""` | no |
| options | A list of Options to apply | `any` | `[]` | no |
| tags | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |
| timeouts | Define maximum timeout for deletion of `aws_db_option_group` resource | `map(string)` | <pre>{<br>  "delete": "15m"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| this\_db\_option\_group\_arn | The ARN of the db option group |
| this\_db\_option\_group\_id | The db option group id |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

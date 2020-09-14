# aws_db_parameter_group

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
| description | The description of the DB parameter group | `string` | `""` | no |
| family | The family of the DB parameter group | `string` | n/a | yes |
| identifier | The identifier of the resource | `string` | n/a | yes |
| name | The name of the DB parameter group | `string` | `""` | no |
| name\_prefix | Creates a unique name beginning with the specified prefix | `string` | `""` | no |
| parameters | A list of DB parameter maps to apply | `list(map(string))` | `[]` | no |
| tags | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |
| use\_name\_prefix | Whether to use name\_prefix or not | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| this\_db\_parameter\_group\_arn | The ARN of the db parameter group |
| this\_db\_parameter\_group\_id | The db parameter group id |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

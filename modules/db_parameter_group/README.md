# aws_db_parameter_group

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| create | Whether to create this resource or not? | string | `true` | no |
| family | The family of the DB parameter group | string | - | yes |
| identifier | The identifier of the resource | string | - | yes |
| name_prefix | Creates a unique name beginning with the specified prefix | string | - | yes |
| parameters | A list of DB parameter maps to apply | string | `<list>` | no |
| tags | A mapping of tags to assign to the resource | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| this_db_parameter_group_arn | The ARN of the db parameter group |
| this_db_parameter_group_id | The db parameter group id |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

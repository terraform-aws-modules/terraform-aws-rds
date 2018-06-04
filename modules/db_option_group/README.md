# aws_db_option_group

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| create | Whether to create this resource or not? | string | `true` | no |
| engine_name | Specifies the name of the engine that this option group should be associated with | string | - | yes |
| identifier | The identifier of the resource | string | - | yes |
| major_engine_version | Specifies the major version of the engine that this option group should be associated with | string | - | yes |
| name_prefix | Creates a unique name beginning with the specified prefix | string | - | yes |
| option_group_description | The description of the option group | string | `` | no |
| options | A list of Options to apply | list | `<list>` | no |
| tags | A mapping of tags to assign to the resource | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| this_db_option_group_arn | The ARN of the db option group |
| this_db_option_group_id | The db option group id |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

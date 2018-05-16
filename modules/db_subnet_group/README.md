# aws_db_subnet_group

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| create | Whether to create this resource or not? | string | `true` | no |
| identifier | The identifier of the resource | string | - | yes |
| name_prefix | Creates a unique name beginning with the specified prefix | string | - | yes |
| subnet_ids | A list of VPC subnet IDs | list | `<list>` | no |
| tags | A mapping of tags to assign to the resource | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| this_db_subnet_group_arn | The ARN of the db subnet group |
| this_db_subnet_group_id | The db subnet group name |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

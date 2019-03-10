# aws_db_subnet_group

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| create | Whether to create this resource or not? | string | `"true"` | no |
| identifier | The identifier of the resource | string | n/a | yes |
| name\_prefix | Creates a unique name beginning with the specified prefix | string | n/a | yes |
| subnet\_ids | A list of VPC subnet IDs | list | `<list>` | no |
| tags | A mapping of tags to assign to the resource | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| this\_db\_subnet\_group\_arn | The ARN of the db subnet group |
| this\_db\_subnet\_group\_id | The db subnet group name |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

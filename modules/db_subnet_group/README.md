# aws_db_subnet_group

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| create | Whether to create this resource or not? | bool | `"true"` | no |
| identifier | The identifier of the resource | string | n/a | yes |
| name | The name of the DB subnet group. If omitted, Terraform will assign a random, unique name. If use\_name\_prefix = true, creates a unique name beginning with the specified prefix | string | `"null"` | no |
| subnet\_ids | A list of VPC subnet IDs | list(string) | `[]` | no |
| tags | A mapping of tags to assign to the resource | map(string) | `{}` | no |
| use\_name\_prefix | Whether to use name as a prefix or not | bool | `"true"` | no |

## Outputs

| Name | Description |
|------|-------------|
| this\_db\_subnet\_group\_arn | The ARN of the db subnet group |
| this\_db\_subnet\_group\_id | The db subnet group name |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

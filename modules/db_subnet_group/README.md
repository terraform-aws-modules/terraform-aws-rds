# aws_db_subnet_group

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.26 |
| aws | >= 2.49 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.49 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_db_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create | Whether to create this resource or not? | `bool` | `true` | no |
| description | The description of the DB subnet group | `string` | `""` | no |
| name | The name of the DB subnet group | `string` | `""` | no |
| subnet\_ids | A list of VPC subnet IDs | `list(string)` | `[]` | no |
| tags | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |
| use\_name\_prefix | Determines whether to use `name` as is or create a unique name beginning with `name` as the specified prefix | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| this\_db\_subnet\_group\_arn | The ARN of the db subnet group |
| this\_db\_subnet\_group\_id | The db subnet group name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

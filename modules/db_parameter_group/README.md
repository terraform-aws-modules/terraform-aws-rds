# aws_db_parameter_group

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
| [aws_db_parameter_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create | Whether to create this resource or not? | `bool` | `true` | no |
| description | The description of the DB parameter group | `string` | `""` | no |
| family | The family of the DB parameter group | `string` | n/a | yes |
| name | The name of the DB parameter group | `string` | n/a | yes |
| parameters | A list of DB parameter maps to apply | `list(map(string))` | `[]` | no |
| tags | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |
| use\_name\_prefix | Determines whether to use `name` as is or create a unique name beginning with `name` as the specified prefix | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| this\_db\_parameter\_group\_arn | The ARN of the db parameter group |
| this\_db\_parameter\_group\_id | The db parameter group id |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

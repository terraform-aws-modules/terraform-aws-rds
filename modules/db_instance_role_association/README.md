# aws_db_instance

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance_role_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance_role_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input\_create) | Determines whether to create a DB instance role association | `bool` | `true` | no |
| <a name="input_db_instance_identifier"></a> [db\_instance\_identifier](#input\_db\_instance\_identifier) | The database instance identifier to associate the role | `string` | n/a | yes |
| <a name="input_db_instance_role_association_feature_name"></a> [db\_instance\_role\_association\_feature\_name](#input\_db\_instance\_role\_association\_feature\_name) | Name of the feature for association | `string` | `null` | no |
| <a name="input_db_instance_role_association_role_arn"></a> [db\_instance\_role\_association\_role\_arn](#input\_db\_instance\_role\_association\_role\_arn) | Amazon Resource Name (ARN) of the IAM Role to associate with the DB Instance | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_instance_role_association_id"></a> [db\_instance\_role\_association\_id](#output\_db\_instance\_role\_association\_id) | DB Instance Identifier and IAM Role ARN separated by a comma |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

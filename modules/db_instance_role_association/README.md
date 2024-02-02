# aws_db_instance_role_association

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.33 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.33 |

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
| <a name="input_db_instance_identifier"></a> [db\_instance\_identifier](#input\_db\_instance\_identifier) | The database instance identifier to associate the role | `string` | `null` | no |
| <a name="input_feature_name"></a> [feature\_name](#input\_feature\_name) | Name of the feature for association | `string` | `null` | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | Amazon Resource Name (ARN) of the IAM Role to associate with the DB Instance | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_instance_role_association_id"></a> [db\_instance\_role\_association\_id](#output\_db\_instance\_role\_association\_id) | DB Instance Identifier and IAM Role ARN separated by a comma |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

resource "aws_db_instance_role_association" "this" {
  count = var.create ? 1 : 0

  db_instance_identifier = var.db_instance_identifier
  feature_name           = var.db_instance_role_association_feature_name
  role_arn               = var.db_instance_role_association_role_arn
}

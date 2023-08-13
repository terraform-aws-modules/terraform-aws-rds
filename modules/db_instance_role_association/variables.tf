variable "create" {
  description = "Determines whether to create a DB instance role association"
  type        = bool
  default     = true
}

variable "db_instance_role_association_feature_name" {
  description = "Name of the feature for association"
  type        = string
  default     = null
}

variable "db_instance_role_association_role_arn" {
  description = "Amazon Resource Name (ARN) of the IAM Role to associate with the DB Instance"
  type        = string
  default     = null
}

variable "db_instance_identifier" {
  description = "The database instance identifier to associate the role"
  type        = string
}

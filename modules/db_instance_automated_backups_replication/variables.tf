variable "create" {
  description = "Whether to create this resource or not?"
  type        = bool
  default     = true
}

variable "kms_key_arn" {
  description = "The KMS encryption key ARN in the destination AWS Region"
  type        = string
  default     = null
}

variable "pre_signed_url" {
  description = "A URL that contains a Signature Version 4 signed request for the StartDBInstanceAutomatedBackupsReplication action to be called in the AWS Region of the source DB instance"
  type        = string
  default     = null
}

variable "retention_period" {
  description = "The retention period for the replicated automated backups"
  type        = number
  default     = 7
}

variable "source_db_instance_arn" {
  description = "The ARN of the source DB instance for the replicated automated backups"
  type        = string
  default     = null
}

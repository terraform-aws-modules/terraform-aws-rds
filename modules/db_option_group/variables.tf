variable "create" {
  description = "Whether to create this resource or not?"
  type        = bool
  default     = true
}

variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix"
  type        = string
}

variable "identifier" {
  description = "The identifier of the resource"
  type        = string
}

variable "option_group_description" {
  description = "The description of the option group"
  type        = string
  default     = ""
}

variable "engine_name" {
  description = "Specifies the name of the engine that this option group should be associated with"
  type        = string
}

variable "major_engine_version" {
  description = "Specifies the major version of the engine that this option group should be associated with"
  type        = string
}

variable "options" {
  description = "A list of Options to apply"
  type        = any
  default     = []
}

variable "timeouts" {
  description = "Define maximum timeout for deletion of `aws_db_option_group` resource"
  type        = map(string)
  default = {
    delete = "15m"
  }
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

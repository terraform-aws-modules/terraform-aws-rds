variable "create" {
  description = "Whether to create this resource or not?"
  type        = bool
  default     = true
}

variable "name" {
  description = "The name of the DB option group"
  type        = string
}

variable "use_name_prefix" {
  description = "Whether to use name as a prefix or not"
  type        = bool
  default     = true
}

variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix"
  type        = string
  default     = ""
}

variable "identifier" {
  description = "The identifier of the resource"
  type        = string
}

variable "description" {
  description = "Description of the option group"
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

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "timeouts" {
  description = "(Optional) Applies to `aws_db_option_group` in particular to allow AWS enough time to delete resource"
  type        = map(string)

  default = {
    delete = "15m"
  }
}

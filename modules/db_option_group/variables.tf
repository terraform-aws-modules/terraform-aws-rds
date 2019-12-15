variable "create" {
  description = "Whether to create this resource or not?"
  type        = bool
  default     = true
}

variable "name" {
  description = "The name of the DB option group. If omitted, Terraform will assign a random, unique name. If use_name_prefix = true, creates a unique name beginning with the specified prefix"
  type        = string
  default     = null
}

variable "use_name_prefix" {
  description = "Whether to use name as a prefix or not"
  type        = bool
  default     = true
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

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

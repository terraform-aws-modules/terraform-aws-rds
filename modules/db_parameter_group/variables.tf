variable "create" {
  description = "Whether to create this resource or not?"
  default     = true
}

variable "description" {
  default     = ""
  description = "The description of the DB parameter group"
}

variable "name" {
  default     = ""
  description = "The name of the DB parameter group"
}

variable "name_prefix" {
  default     = ""
  description = "Creates a unique name beginning with the specified prefix"
}

variable "identifier" {
  description = "The identifier of the resource"
}

variable "family" {
  description = "The family of the DB parameter group"
}

variable "parameters" {
  description = "A list of DB parameter maps to apply"
  default     = []
}

variable "tags" {
  type        = "map"
  description = "A mapping of tags to assign to the resource"
  default     = {}
}

variable "use_name_prefix" {
  description = "Whether to use name_prefix or not"
  default     = true
}

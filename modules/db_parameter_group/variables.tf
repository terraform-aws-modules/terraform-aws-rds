variable "create" {
  description = "Whether to create this resource or not?"
  type        = bool
  default     = true
}

variable "description" {
  description = "The description of the DB parameter group"
  type        = string
  default     = ""
}

variable "name" {
  description = "The name of the DB parameter group. If omitted, Terraform will assign a random, unique name. If use_name_prefix = true, creates a unique name beginning with the specified prefix"
  type        = string
  default     = null
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

variable "family" {
  description = "The family of the DB parameter group"
  type        = string
}

variable "parameters" {
  description = "A list of DB parameter maps to apply"
  type        = list(map(string))
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

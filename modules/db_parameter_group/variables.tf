variable "count" {
  description = "Whether to create this resource or not?"
  default     = 1
}

variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix"
}

variable "identifier" {
  description = "The identifier of the resource"
}

variable "family" {
  description = "The family of the DB parameter group"
}

variable "parameters" {
  type        = "map"
  description = "A map of lists of DB parameters to apply"
  default     = {}
}

variable "tags" {
  type        = "map"
  description = "A mapping of tags to assign to the resource"
  default     = {}
}

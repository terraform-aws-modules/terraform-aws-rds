variable "create" {
  description = "Whether to create this resource or not?"
  default     = true
}

variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix"
}

variable "identifier" {
  description = "The identifier of the resource"
}

variable "subnet_ids" {
  type        = "list"
  description = "A list of VPC subnet IDs"
  default     = []
}

variable "tags" {
  type        = "map"
  description = "A mapping of tags to assign to the resource"
  default     = {}
}

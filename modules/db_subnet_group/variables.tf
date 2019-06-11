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

variable "subnet_ids" {
  description = "A list of VPC subnet IDs"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}


variable "create" {
  description = "Whether to create this resource or not?"
  type        = bool
  default     = true
}

variable "name" {
  description = "The name of the DB subnet group"
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
  description = "Description of the subnet group"
  type        = string
  default     = ""
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


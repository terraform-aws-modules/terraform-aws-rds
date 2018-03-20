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

variable "family" {
  description = "The family of the DB parameter group"
}

variable "apply_method" {
  description = "Some engines can't apply some parameters without a reboot, and you will need to specify pending-reboot here."
  default     = "immediate"
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

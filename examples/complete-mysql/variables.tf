# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
# ---------------------------------------------------------------------------------------------------------------------

variable "aws_region" {
  description = "AWS Region to create this resource"
  type        = string
  default     = "eu-west-1"
}

variable "username" {
  description = "Master username of the DB"
  type        = string
  default     = "user"
}

variable "password" {
  description = "Master password of the DB"
  type        = string
  default     = "YourPwdShouldBeLongAndSecure!"
}

variable "database_name" {
  description = "Name of the database to be created"
  type        = string
  default     = "demodb"
}

variable "major_engine_version" {
  description = "MAJOR.MINOR version of the DB engine"
  type        = string
  default     = "5.7"
}

variable "engine_version" {
  description = "Version of the database to be launched"
  type        = string
  default     = "5.7.19"
}

variable "engine_name" {
  description = "Name of the database engine"
  type        = string
  default     = "mysql"
}

variable "name" {
  description = "Name of the database"
  type        = string
  default     = "terratest-example"
}

# Use true only for test purpose to deploy in production use false to avoid unauthorized access
variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  type        = bool
  default     = true
}

variable "port" {
  description = "The port on which the DB accepts connections"
  type        = string
  default     = "3306"
}
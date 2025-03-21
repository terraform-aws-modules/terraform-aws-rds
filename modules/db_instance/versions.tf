terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.92"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 3.1"
    }
  }
}

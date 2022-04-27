terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.6"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 3.1"
    }
  }
}

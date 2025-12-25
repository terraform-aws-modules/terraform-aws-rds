terraform {
  required_version = ">= 1.11"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.27"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 3.1"
    }
  }

  provider_meta "aws" {
    user_agent = [
      "github.com/terraform-aws-modules"
    ]
  }
}

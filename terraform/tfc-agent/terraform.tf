terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.74.0"
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.98.1"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.60.0"
    }
  }
}

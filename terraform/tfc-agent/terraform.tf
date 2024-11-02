terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.73.0"
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.97.0"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.59.0"
    }
  }
}
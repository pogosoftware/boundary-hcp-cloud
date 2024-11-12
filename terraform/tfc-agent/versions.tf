terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.75.1"
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.99.0"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.60.0"
    }
  }
}

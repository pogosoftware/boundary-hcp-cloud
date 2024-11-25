terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.75.1"
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.98.1"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.60.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "4.5.0"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.74.0"
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.97.0"
    }
    boundary = {
      source  = "hashicorp/boundary"
      version = "1.2.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "4.4.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.6"
    }
  }
}

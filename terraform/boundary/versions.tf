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
    boundary = {
      source  = "hashicorp/boundary"
      version = "1.2.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "4.5.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.6"
    }
  }
}

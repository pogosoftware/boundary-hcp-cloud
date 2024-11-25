terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.99.0"
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

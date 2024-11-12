terraform {
  required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.6"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.75.1"
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.99.0"
    }
  }
}

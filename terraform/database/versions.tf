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
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.24.0"
    }
  }
}

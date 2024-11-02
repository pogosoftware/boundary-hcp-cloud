terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.73.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
    postgresql = {
      source = "cyrilgdn/postgresql"
      version = "1.24.0"
    }
  }
}

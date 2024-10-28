required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "5.73.0"
  }
  hcp = {
    source  = "hashicorp/hcp"
    version = "0.97.0"
  }
  random = {
    source  = "hashicorp/random"
    version = "3.6.3"
  }
  vault = {
    source  = "hashicorp/vault"
    version = "4.4.0"
  }
}

provider "aws" "develop" {
  config {
    region = var.aws_region

    assume_role_with_web_identity {
      role_arn           = var.role_arn
      web_identity_token = var.identity_token
    }

    default_tags {
      tags = var.default_tags
    }
  }
}

provider "hcp" "this" {
  config {
    project_id = var.hcp_project_id

    workload_identity {
      resource_name = var.hcp_workload_identity_provider
      token         = var.hcp_token
    }
  }
}

provider "vault" "this" {
  config {
    address = component.hcp_cloud.hcp_vault_private_endpoint_url
  }
}

provider "random" "this" {}

required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "5.72.1"
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
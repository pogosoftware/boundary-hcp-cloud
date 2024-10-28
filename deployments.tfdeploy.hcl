identity_token "aws" {
  audience = ["aws.workload.identity"]
}

identity_token "hcp" {
  audience = ["hcp.workload.identity"]
}

store "varset" "dev" {
  id       = "varset-ZeHpgxnWKZkCJMfF"
  category = "terraform"
}

deployment "deployment" {
  inputs = {
    aws_region                     = store.varset.dev.aws_region
    hcp_project_id                 = store.varset.dev.hcp_project_id
    role_arn                       = store.varset.dev.aws_stacks_role_arn
    identity_token                 = identity_token.aws.jwt
    hcp_token                      = identity_token.hcp.jwt
    hcp_workload_identity_provider = store.varset.dev.hcp_workload_identity_provider
    environment                    = store.varset.dev.environment
    default_tags                   = { Environment = "Development" }
  }
}

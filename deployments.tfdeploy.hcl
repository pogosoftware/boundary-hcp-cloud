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
    aws_region                     = "eu-central-1"
    hcp_project_id                 = "d9720027-8bb1-4542-98a3-744da821d0cf"
    role_arn                       = store.varset.dev.aws_stacks_role_arn
    identity_token                 = identity_token.aws.jwt
    hcp_token                      = identity_token.hcp.jwt
    hcp_workload_identity_provider = store.varset.dev.hcp_workload_identity_provider
    environment                    = "dev"
    default_tags                   = { Environment = "Development" }
  }
}

####################################################################################################
### AWS
####################################################################################################
resource "aws_iam_role" "stacks_role" {
  name               = local.name
  assume_role_policy = data.aws_iam_policy_document.stacks_assume_role_policy.json
}

resource "aws_iam_role_policy" "stacks_role_policy" {
  name   = local.name
  role   = aws_iam_role.stacks_role.id
  policy = data.aws_iam_policy_document.stacks_role_policy.json
}

####################################################################################################
### HCP
####################################################################################################
resource "hcp_service_principal" "stacks_service_principal" {
  name   = local.name
  parent = data.hcp_project.current.resource_name
}

resource "hcp_project_iam_binding" "stacks_service_principal_binding" {
  project_id   = data.hcp_project.current.resource_id
  principal_id = hcp_service_principal.stacks_service_principal.resource_id

  # Set this to the level of access your stack should have.
  role = "roles/contributor"
}

resource "hcp_iam_workload_identity_provider" "stacks_identity_provider" {
  name              = local.name
  service_principal = hcp_service_principal.stacks_service_principal.resource_name
  description       = "Allow Terraform Stacks access to this HCP Project."

  oidc = {
    issuer_uri        = "https://${var.tfc_hostname}"
    allowed_audiences = ["hcp.workload.identity"]
  }

  conditional_access = "jwt_claims.sub matches `${local.sub_regex}`"
}

####################################################################################################
### VARIABLE SETS
####################################################################################################
module "credentials_variable_set" {
  source  = "pogosoftware/tfe/tfe//modules/variable-set"
  version = "3.0.3"

  name        = local.name
  description = "Variables used by stacks resources"

  variables = {
    hcp_workload_identity_provider = {
      value    = hcp_iam_workload_identity_provider.stacks_identity_provider.resource_name
      category = "terraform"
    },
    aws_stacks_role_arn = {
      value    = aws_iam_role.stacks_role.arn
      category = "terraform"
    },
    hcp_project_id = {
      value    = var.hcp_project_id
      category = "terraform"
    },
    environment = {
      value    = var.environment
      category = "terraform"
    },
    aws_region = {
      value    = var.aws_region
      category = "terraform"
    }
  }
}

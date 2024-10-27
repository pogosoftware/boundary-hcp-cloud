####################################################################################################
### AWS
####################################################################################################
resource "aws_iam_openid_connect_provider" "stacks_openid_provider" {
  url            = "https://${var.tfc_hostname}"
  client_id_list = ["aws.workload.identity"]

  thumbprint_list = [data.tls_certificate.tfc_certificate.certificates[0].sha1_fingerprint]
}

resource "aws_iam_role" "stacks_role" {
  name               = substr(replace("stacks-${var.tfc_organization}-${var.tfc_project}", "/[^\\w+=,.@-]/", "-"), 0, 64)
  assume_role_policy = data.aws_iam_policy_document.stacks_assume_role_policy.json
}

resource "aws_iam_role_policy" "stacks_role_policy" {

  name   = substr(replace("stacks-${var.tfc_organization}-${var.tfc_project}", "/[^\\w+=,.@-]/", "-"), 0, 64)
  role   = aws_iam_role.stacks_role.id
  policy = data.aws_iam_policy_document.stacks_role_policy.json
}

####################################################################################################
### HCP
####################################################################################################
resource "hcp_service_principal" "stacks_service_principal" {
  name   = "stacks-${var.tfc_organization}-${var.tfc_project}-${var.tfc_stack}"
  parent = data.hcp_project.hcp_project.resource_name
}

resource "hcp_project_iam_binding" "stacks_service_principal_binding" {
  project_id   = data.hcp_project.hcp_project.resource_id
  principal_id = hcp_service_principal.stacks_service_principal.resource_id

  # Set this to the level of access your stack should have.
  role = "roles/contributor"
}

resource "hcp_iam_workload_identity_provider" "stacks_identity_provider" {
  name              = "stacks-${var.tfc_organization}-${var.tfc_project}-${var.tfc_stack}"
  service_principal = hcp_service_principal.stacks_service_principal.resource_name
  description       = "Allow Terraform Stacks access to this HCP Project."

  oidc = {
    issuer_uri        = "https://app.terraform.io"
    allowed_audiences = ["hcp.workload.identity"]
  }

  conditional_access = "jwt_claims.sub matches `${local.sub_regex}`"
}

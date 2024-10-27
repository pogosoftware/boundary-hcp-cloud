locals {
  tfc_organization = data.hcp_organization.current.resource_name
  tfc_project = data.hcp_project.current.resource_name

  name = "${local.tfc_project}-stacks-${var.environment}"
  sub_regex = "^organization:${local.tfc_organization}:project:${local.tfc_project}:stack:${var.tfc_stack}:.*"
}
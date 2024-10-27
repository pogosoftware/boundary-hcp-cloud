locals {
  sub_regex = "^organization:${var.tfc_organization}:project:${var.tfc_project}:stack:${var.tfc_stack}:.*"
}
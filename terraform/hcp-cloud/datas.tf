data "hcp_organization" "this" {}
data "hcp_project" "this" {}
data "aws_region" "current" {}

data "terraform_remote_state" "bootstrap" {
  backend = "remote"

  config = {
    organization = data.hcp_organization.this.name
    workspaces = {
      name = var.bootstrap_workspace_name
    }
  }
}

data "terraform_remote_state" "network" {
  backend = "remote"

  config = {
    organization = data.hcp_organization.this.name
    workspaces = {
      name = data.terraform_remote_state.bootstrap.outputs.workspaces["network"].name
    }
  }
}

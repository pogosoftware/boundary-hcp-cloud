data "terraform_remote_state" "network" {
  backend = "remote"

  config = {
    organization = var.tfc_organization
    workspaces = {
      name = var.tfc_network_workspace_name
    }
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

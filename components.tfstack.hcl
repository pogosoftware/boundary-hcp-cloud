component "network" {
  source = "./terraform/network"

  providers = {
    aws = provider.aws.develop
  }
}

component "hcp_cloud" {
  source = "./terraform/hcp-cloud"

  inputs = {
    environment             = var.environment
    hcp_project_id          = var.hcp_project_id
    peer_vpc_id             = component.network.peer_vpc_id
    peer_account_id         = component.network.vpc_owner_id
    peer_vpc_region         = "eu-central-1" #var.aws_region
    peer_destination_cidr   = component.network.vpc_cidr_block
    private_route_table_ids = component.network.private_route_table_ids
  }

  providers = {
    aws    = provider.aws.develop
    hcp    = provider.hcp.this
    random = provider.random.this
  }
}

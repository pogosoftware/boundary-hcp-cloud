component "network" {
  source = "./terraform/network"

  providers = {
    aws = provider.aws.develop
  }
}

component "tfc-agent" {
  source = "./terraform/tfc-agent"

  inputs = {
    aws_region                    = var.aws_region
    environment                   = var.environment
    ecs_cluster_private_subnet_id = component.network.private_subnet_ids[0]
    ecs_cluster_sg_id             = component.network.security_group_ids["tfc-agent"]
  }
  providers = {
    aws = provider.aws.develop
    hcp = provider.hcp.this
    tfe = provider.tfe.this
  }
}

component "hcp_cloud" {
  source = "./terraform/hcp-cloud"

  inputs = {
    environment             = var.environment
    hcp_project_id          = var.hcp_project_id
    peer_vpc_id             = component.network.vpc_id
    peer_account_id         = component.network.vpc_owner_id
    peer_vpc_region         = var.aws_region
    peer_destination_cidr   = component.network.vpc_cidr_block
    private_route_table_ids = component.network.private_route_table_ids
  }

  providers = {
    aws    = provider.aws.develop
    hcp    = provider.hcp.this
    random = provider.random.this
  }
}

component "vault" {
  source = "./terraform/vault"

  providers = {
    vault = provider.vault.this
    hcp   = provider.hcp.this
    tls   = provider.tls.this
  }

  depends_on = [component.hcp_cloud]
}

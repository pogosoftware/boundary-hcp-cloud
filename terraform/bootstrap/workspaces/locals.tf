locals {
  name_prefix           = var.name_prefix == null || var.name_prefix == "" ? "" : format("%s-", var.name_prefix)
  hcp_organization_name = data.hcp_organization.current.name
  hcp_project_name      = data.hcp_project.current.name

  create_network_workspace = contains(["dev"], var.environment)
  network_workspace_name   = format("%snetwork-%s", local.name_prefix, var.environment)

  create_hcp_cloud_workspace = contains(["dev"], var.environment)
  hcp_cloud_workspace_name   = format("%shcp-cloud-%s", local.name_prefix, var.environment)

  create_vault_workspace = contains(["dev"], var.environment)
  vault_workspace_name   = format("%svault-%s", local.name_prefix, var.environment)

  create_boundary_workspace = contains(["dev"], var.environment)
  boundary_workspace_name   = format("%sboundary-%s", local.name_prefix, var.environment)

  create_tfc_agent_workspace = contains(["dev"], var.environment)
  tfc_agent_workspace_name   = format("%stfc-agent-%s", local.name_prefix, var.environment)

  workspace_ids_for_aws = compact([
    local.create_network_workspace ? module.network_workspace.id : null,
    local.create_hcp_cloud_workspace ? module.hcp_cloud_workspace.id : null,
    local.create_boundary_workspace ? module.boundary_workspace.id : null,
    local.create_tfc_agent_workspace ? module.tfc_agent_workspace.id : null
  ])

  workspace_ids_for_hcp = compact([
    local.create_hcp_cloud_workspace ? module.hcp_cloud_workspace.id : null,
    local.create_vault_workspace ? module.vault_workspace.id : null,
    local.create_boundary_workspace ? module.boundary_workspace.id : null,
    local.create_tfc_agent_workspace ? module.tfc_agent_workspace.id : null
  ])
}

provider "boundary" {
  addr                   = local.boundary_cluster_url
  auth_method_login_name = local.boundary_username
  auth_method_password   = local.boundary_password
}

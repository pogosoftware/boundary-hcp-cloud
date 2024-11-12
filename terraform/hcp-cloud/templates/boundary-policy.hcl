path "auth/token/create" {
  capabilities = ["create", "update"]
}

path "apps/data/infra/boundary" {
  capabilities = ["read"]
}

path "database/creds/readonly" {
  capabilities = ["create", "update", "read", "delete"]
}

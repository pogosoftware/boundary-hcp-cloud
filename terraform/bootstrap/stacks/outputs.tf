output "role_arn" {
    value = aws_iam_role.stacks_role.arn
}

output "workload_identity_provider" {
  value = hcp_iam_workload_identity_provider.stacks_identity_provider.resource_name
}

output "credentials_variable_set_id" {
  value = module.credentials_variable_set.id
}
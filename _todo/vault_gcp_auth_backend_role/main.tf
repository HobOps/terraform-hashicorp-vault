locals {
  role_bound_service_accounts = [for service_account in var.role_bound_service_accounts : service_account.email]
}

resource "vault_policy" "default" {
  name = var.role_name
  policy = templatefile("${path.module}/templates/policy.tmpl", {
    project_id   = var.project_id,
    environments = var.environments
  })
}

# Creates roles
resource "vault_gcp_auth_backend_role" "default" {
  role        = var.role_name
  type        = var.role_type
  backend     = var.vault_backend.path
  max_jwt_exp = var.role_max_jwt_exp

  token_bound_cidrs = var.role_token_bound_cidrs
  token_policies    = [vault_policy.default.id]

  bound_projects         = [var.project_id]
  bound_service_accounts = local.role_bound_service_accounts
}

# Grants permissions for authenticating against Vault
# Reference: https://www.vaultproject.io/docs/auth/gcp#permissions-for-authenticating-against-vault
resource "google_service_account_iam_member" "default" {
  for_each = { for sa in var.role_bound_service_accounts : sa.email => {
    service_account_id = sa.service_account.id
    member             = sa.iam_email
  } }
  service_account_id = each.value.service_account_id
  role               = "roles/iam.serviceAccountTokenCreator"

  member = each.value.member
}
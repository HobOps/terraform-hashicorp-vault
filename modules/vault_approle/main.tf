# Creates policy
resource "vault_policy" "default" {
  name = var.role_name
  policy = templatefile("${path.module}/templates/policy.tmpl", {
    mount   = var.mount,
    environments = var.environments
  })
}

# Creates roles
resource "vault_approle_auth_backend_role" "default" {
  role_name = var.role_name
  backend   = var.vault_backend.path

  token_bound_cidrs = var.role_token_bound_cidrs
  token_policies    = [vault_policy.default.id]
}

# Creates approle
resource "vault_approle_auth_backend_role_secret_id" "default" {
  backend   = var.vault_backend.path
  role_name = vault_approle_auth_backend_role.default.role_name
  cidr_list = var.cidr_list
  secret_id = var.secret_id
  metadata = jsonencode(var.metadata)
}
variable "vault_auth_backend" {
  type    = any
  default = {}
}

module "vault_auth_backend" {
  for_each = var.vault_auth_backend
  source   = "./modules/vault_auth_backend"

  path        = each.key
  type        = lookup(each.value, "type", each.key)
  description = lookup(each.value, "description", "")
  tune        = lookup(each.value, "tune", {})
  local       = lookup(each.value, "local", null)
}

output "vault_auth_backend" {
  value = module.vault_auth_backend
}


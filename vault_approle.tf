variable "vault_approle" {
  type    = any
  default = {}
}

module "vault_approle" {
  for_each = var.vault_approle
  source   = "./modules/vault_approle"

  role_name     = each.key
  mount         = lookup(each.value, "mount")
  secret_id     = lookup(each.value, "secret_id")
  environments  = lookup(each.value, "environments", [])
  vault_backend = lookup(each.value, "vault_backend", [])
  cidr_list     = lookup(each.value, "cidr_list", [])
  metadata      = lookup(each.value, "metadata", {})
}

output "vault_approle" {
  value = module.vault_approle
}

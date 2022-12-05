variable "vault_mount" {
  type    = string
  default = ""
}

module "vault_mount" {
  for_each    = var.vault_mount != "" ? toset([var.vault_mount]) : []
  source      = "./modules/vault_mount/"
  path        = each.key
  description = lookup(var.vault_mount, "description", "")
  type        = lookup(var.vault_mount, "type", "")
}

output "vault_mount" {
  value = module.vault_mount
}

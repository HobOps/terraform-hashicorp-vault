variable "vault_mount" {
  type    = string
  default = ""
}

module "vault_mount" {
  for_each = var.vault_mount != "" ? toset([var.vault_mount]) : []
  source   = "./modules/vault_mount/"
  path     = each.key
}

output "vault_mount" {
  value = module.vault_mount
}

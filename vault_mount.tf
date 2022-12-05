variable "vault_mount" {
  type    = string
  default = ""
}

variable "type" {
  type    = string
  default = "kv-v2"
}

variable "options" {
  type    = any
  default = {}
}

module "vault_mount" {
  for_each = var.vault_mount != "" ? toset([var.vault_mount]) : []
  source   = "./modules/vault_mount/"
  path     = each.key
  type     = var.type
  options  = var.options
}

output "vault_mount" {
  value = module.vault_mount
}

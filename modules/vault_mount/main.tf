resource "vault_mount" "default" {
  path        = var.path
  type        = var.type
  description = var.description
  options     = var.options
}
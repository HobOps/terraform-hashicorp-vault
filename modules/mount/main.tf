resource "mount" "default" {
  path        = var.path
  type        = var.type
  description = var.description
}
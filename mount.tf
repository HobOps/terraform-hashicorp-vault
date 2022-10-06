variable "mount" {
  type    = any
  default = []
}

module "mount" {
  for_each = toset([var.mount])
  source   = "modules/mount/"
  path     = each.key
}

output "mount" {
  value = module.mount
}

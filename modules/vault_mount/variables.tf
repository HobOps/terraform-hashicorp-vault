variable "description" {
  type    = string
  default = "Managed by Terraform"
}

variable "path" {
  type = string
}

variable "type" {
  type    = string
  default = "kv-v2"
}

variable "options" {
  type    = any
  default = {}
}
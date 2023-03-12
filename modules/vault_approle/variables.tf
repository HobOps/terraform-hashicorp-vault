variable "mount" {
  type = string
}

variable "role_name" {
  type = string
}

variable "role_token_bound_cidrs" {
  type    = list(string)
  default = []
}

variable "cidr_list" {
  type    = list(string)
  default = []
}

variable "vault_backend" {
  type = any
}

variable "environments" {
  type = list(string)
}

variable "secret_id" {
  type = string
}

variable "metadata" {
  type    = any
  default = {}
}
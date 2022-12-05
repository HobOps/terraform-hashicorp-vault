terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.4.1"
    }
  }
}

provider "vault" {
  address      = lookup(var.vault_provider, "address")
  ca_cert_file = lookup(var.vault_provider, "ca_cert_file", null)
  token        = lookup(var.vault_provider, "token", null)
}

variable "vault_provider" {
  type    = any
  default = {}
}
variable "project_id" {
  type = string
}

variable "role_name" {
  type = string
}

variable "role_type" {
  type    = string
  default = "iam"
}

variable "role_max_jwt_exp" {
  type    = number
  default = 3600
}

variable "role_token_bound_cidrs" {
  type    = list(string)
  default = []
}

variable "role_bound_service_accounts" {
  type = any
}

variable "vault_backend" {
  type = any
}

variable "environments" {
  type = list(string)
}

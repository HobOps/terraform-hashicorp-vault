variable "path" {
  type        = string
  description = "The path to mount the auth method"
}

variable "description" {
  type        = string
  description = "The description of the auth method"
  default     = ""
}

variable "local" {
  type        = bool
  description = "If set, the auth method is not replicated nor removed by replication"
  default     = false
}

variable "type" {
  type        = string
  description = "The name of the auth method type"
}

variable "tune" {
  type        = any
  description = "The tune options for the auth method"
  default     = []
}
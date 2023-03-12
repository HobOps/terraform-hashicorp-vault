resource "vault_auth_backend" "default" {
  description = var.description
  local       = var.local
  path        = var.path
  type        = var.type

  dynamic "tune" {
    for_each = toset([var.tune])
    content {
      allowed_response_headers     = lookup(tune.value, "allowed_response_headers", null)
      audit_non_hmac_request_keys  = lookup(tune.value, "audit_non_hmac_request_keys", null)
      audit_non_hmac_response_keys = lookup(tune.value, "audit_non_hmac_response_keys", null)
      default_lease_ttl            = lookup(tune.value, "default_lease_ttl", null)
      listing_visibility           = lookup(tune.value, "listing_visibility", null)
      max_lease_ttl                = lookup(tune.value, "max_lease_ttl", null)
      passthrough_request_headers  = lookup(tune.value, "passthrough_request_headers", null)
      token_type                   = lookup(tune.value, "token_type", null)
    }
  }
}
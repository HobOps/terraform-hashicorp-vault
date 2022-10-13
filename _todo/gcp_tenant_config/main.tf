resource "google_project_iam_custom_role" "default" {
  role_id     = "vault_server_auth"
  title       = "Vault server auth role"
  description = "Vault server auth role"
  permissions = [
    "compute.instanceGroups.list",
    "compute.instances.get",
    "iam.serviceAccountKeys.get",
    "iam.serviceAccounts.get",
  ]
}

resource "google_project_iam_member" "default" {
  project = var.project_id
  role    = google_project_iam_custom_role.default.id
  member  = "serviceAccount:${var.vault_service_account}"
}

resource "mount" "default" {
  path        = var.project_id
  type        = "kv-v2"
  description = "Managed by Terraform"
}

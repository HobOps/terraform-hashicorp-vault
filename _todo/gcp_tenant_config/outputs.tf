output "vault_gcp_role" {
  value = google_project_iam_custom_role.default
}

output "mount" {
  value = mount.default
}
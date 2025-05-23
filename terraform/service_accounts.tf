resource "google_service_account" "testing_sa" {
  account_id   = "testing"
  display_name = "Lets see if I can declare SA with terraform"
}

resource "google_project_iam_member" "testing_storage_access" {
  project = var.project_id
  role    = "roles/storage.objectCreator"
  member  = "serviceAccount:${google_service_account.testing_sa.email}"
}
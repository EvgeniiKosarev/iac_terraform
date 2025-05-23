resource "google_service_account" "sample-db-app-actions-sa" {
  account_id   = "sample-db-app-actions-sa"
  display_name = "SA for Github Workflow for Application"
}

resource "google_project_iam_member" "sample-db-app-actions-sa_kubernetes" {
  project = var.project_id
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.sample-db-app-actions-sa.email}"
}




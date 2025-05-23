resource "google_service_account" "sample-db-app-actions-sa" {
  account_id   = "sample-db-app-actions-sa"
  display_name = "SA for Github Workflow for Application"
}

resource "google_project_iam_member" "sample-db-app-actions-sa_kubernetes" {
  project = var.project_id
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.sample-db-app-actions-sa.email}"
}

resource "google_service_account" "mongodb-vm-sa" {
  account_id   = "mongodb-vm-sa"
  display_name = "SA for VM for MongoDB"
}

resource "google_project_iam_member" "mongodb-vm-sa_storage" {
  project = var.project_id
  role    = "roles/storage.objectCreator"
  member  = "serviceAccount:${google_service_account.mongodb-vm-sa.email}"
}

resource "google_project_iam_member" "mongodb-vm-sa_editor" {
  project = var.project_id
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.mongodb-vm-sa.email}"
}
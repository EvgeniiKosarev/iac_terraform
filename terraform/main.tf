# Public GCS Bucket
resource "google_storage_bucket" "public_bucket" {
  name                        = "${var.project_id}-db-backup"
  location                    = var.region
  force_destroy               = true

}

resource "google_storage_bucket_iam_binding" "public_read" {
  bucket = google_storage_bucket.public_bucket.name
  role   = "roles/storage.objectViewer"
  members = [
    "allUsers",
  ]
}

# Allow SSH from internet
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Allow connections to mongodb
resource "google_compute_firewall" "allow_mongodb" {
  name    = "allow-mongodb"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }

  # We will need to replace this with Kubernetes IP address
  #source_ranges = ["10.116.0.0/20"]
  source_ranges = ["0.0.0.0/0"]

}

# VM with outdated Linux image
resource "google_compute_instance" "db_vm" {
  name         = "mongodb-vm"
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network       = "default"
    access_config {}
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${var.ssh_public_key}"
  }
}

# GKE Cluster
resource "google_container_cluster" "gke_cluster" {
  name     = "cluster-for-evgenii-app"
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  networking_mode = "VPC_NATIVE"

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "default_pool" {
  name       = "default-pool"
  location   = var.region
  cluster    = google_container_cluster.gke_cluster.name
  node_count = 2

  node_config {
    machine_type = "e2-micro"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
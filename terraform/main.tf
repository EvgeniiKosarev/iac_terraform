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

# VM with outdated Linux image
resource "google_compute_instance" "db_vm" {
  name         = "mongodb-vm"
  machine_type = "e2-mini"
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

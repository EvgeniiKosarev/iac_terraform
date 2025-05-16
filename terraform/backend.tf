terraform {
  backend "gcs" {
    bucket = "clgcporg10-190-terraform-backend"
    prefix = "terraform/state"
  }
}
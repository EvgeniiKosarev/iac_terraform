output "cluster_name" {
  value = google_container_cluster.gke_cluster.name
}

output "region" {
  value = var.region
}
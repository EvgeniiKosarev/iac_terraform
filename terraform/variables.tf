variable "project_id" {
  type        = string
  default     = "clgcporg10-190"
}

variable "region" {
  type        = string
  default     = "europe-west1"
}

variable "zone" {
  type        = string
  default     = "europe-west1-b"
}

variable "ssh_user" {
  type        = string
  default = "evgeniikosarev"
}

variable "ssh_public_key" {
  type        = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCj2X9E4zuWsSfj6qDhOBJ+w8ciDimcmtaHAAWO19WNRrh0AnD7bvcM8iwBeVhl/Bo9E2Jklbii1CbuOBcA+s8mR6r4bsmrAqN4P+vM4WgZvCkmZmTEQSxdgxX6PKfl/kmX6JT0xc9yGJVgQ+L+q1wKYC6yGgZcAAZYhsNHdEoLDNgArmKTpbrmOTaLveFNWHuCy7ne0hBUcxgSxDIT6dzqw1YqfTQeEVR6SffJLtrtVmhhEfLjnOyma33K8W5Lhqk/7WXaTtMOt49cXF+qIx+yhprtY7hM0AiwKyVTzUtyBI0maodAKBDS71bsRDq/NMT4RHKVtSMEooAnNqko1+P1+BXogVmzt8uHnKLoE1aui4Kz7dYv6tAle4ssDYdVJQoE12xXFsSMoqBZmxTnGCED12mIOluAwoVKMn/7fRKS9qpkAXVKdTT8BhkQgv+GW9DOesn5YUrYEZoOqXE5AoyPfP+OEhx7DlilugKNitij71Jili2qBIPjyEl3LU32WM8= evgeniikosarev"
}

variable "image" {
  type        = string
  deafulat = "debian-9-stretch-v20220118"
}

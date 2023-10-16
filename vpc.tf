# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.PROJECT_ID}w-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.PROJECT_ID}w-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.0.0.0/24"
}
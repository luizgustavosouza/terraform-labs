resource "google_compute_network" "terraform-inside1-network" {
  name                    = "${var.project_networks["inside_1"]}"
  auto_create_subnetworks = "true"
}

resource "google_compute_network" "terraform-inside2-network" {
  name                    = "${var.project_networks["inside_2"]}"
  auto_create_subnetworks = "true"
}

resource "google_compute_network" "terraform-dmz1-network" {
  name                    = "${var.project_networks["dmz_1"]}"
  auto_create_subnetworks = "true"
}

resource "google_compute_network" "terraform-dmz2-network" {
  name                    = "${var.project_networks["dmz_2"]}"
  auto_create_subnetworks = "true"
}

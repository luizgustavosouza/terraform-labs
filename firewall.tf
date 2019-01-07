resource "google_compute_firewall" "ssh-access" {
  name       = "ssh-remote-access"
  network    = "${var.project_networks["inside_1"]}"
  depends_on = ["google_compute_network.terraform-inside1-network"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "ssh-dmz1-access" {
  name       = "ssh-dmz1-remote-access"
  network    = "${var.project_networks["dmz_1"]}"
  depends_on = ["google_compute_network.terraform-inside1-network"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "rdp-access" {
  name       = "rdp-remote-access"
  network    = "${var.project_networks["inside_2"]}"
  depends_on = ["google_compute_network.terraform-inside2-network"]

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }
}

resource "google_compute_firewall" "web-access" {
  name       = "web-service"
  network    = "${var.project_networks["dmz_1"]}"
  depends_on = ["google_compute_network.terraform-dmz1-network"]

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }
}

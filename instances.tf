resource "google_compute_instance" "gcp-linux-instance" {
  "network_interface" {
    network       = "${var.project_networks["inside_1"]}"
    access_config = {}
  }

  "boot_disk" {
    initialize_params {
      image = "${var.gcp_instances_images["debian9"]}"
    }
  }

  count        = 2
  machine_type = "${var.gcp_machine_types}"

  name       = "lab-terraform-linux${count.index}"
  zone       = "${var.gcp_zone_name["us_central_a"]}"
  depends_on = ["google_compute_network.terraform-inside1-network"]
}

resource "google_compute_instance" "gcp-windows-instance" {
  "boot_disk" {
    initialize_params {
      image = "${var.gcp_instances_images["win2012"]}"
    }
  }

  count        = 2
  machine_type = "${var.gcp_machine_types}"
  name         = "lab-terraform-windows${count.index}"
  zone         = "${var.gcp_zone_name["us_central_b"]}"
  depends_on   = ["google_compute_network.terraform-inside2-network"]

  "network_interface" {
    network       = "${var.project_networks["inside_2"]}"
    access_config = {}
  }
}

resource "google_compute_instance" "gcp-centos-instance" {
  "network_interface" {
    network       = "${var.project_networks["dmz_1"]}"
    access_config = {}
  }

  "boot_disk" {
    initialize_params {
      image = "${var.gcp_instances_images["centos7"]}"
    }
  }

  count        = 2
  machine_type = "${var.gcp_machine_types}"
  name         = "lab-terraform-linux-centos${count.index}"
  zone         = "${var.gcp_zone_name["us_central_c"]}"
  depends_on   = ["google_compute_network.terraform-dmz1-network"]
}

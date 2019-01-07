provider "google" {
  credentials = "${var.gcp_credentials_file}"
  project     = "${var.gcp_project_name["gcp_terraform"]}"
  region      = "${var.gcp_region_name["us_central1"]}"
  zone        = "${var.gcp_zone_name["us_central_a"]}"
}

resource "google_compute_network" "my_network" {
  name                    = "mon-reseau"
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"  # Assurez-vous d'ajouter cette ligne pour une connectivité globale entre régions

  # Spécifiez la plage d'adresses IP pour le réseau VPC
  routing_config {
    dynamic_routing_mode = "GLOBAL"
  }
  ip_range                 = "30.30.30.0/8"
}
resource "google_compute_subnetwork" "AnsibleNodeManager_subnet" {
  name          = "AnsibleNodeManager-subnet"
  ip_cidr_range = "30.30.31.0/24"
  network       = google_compute_network.my_network.self_link
  region        = var.region
}

resource "google_compute_subnetwork" "jenkins_subnet" {
  name          = "jenkins-subnet"
  ip_cidr_range = "30.30.32.0/24"
  network       = google_compute_network.my_network.self_link
  region        = var.region
}

resource "google_compute_subnetwork" "mongodb_subnet" {
  name          = "mongodb-subnet"
  ip_cidr_range = "30.30.33.0/24"
  network       = google_compute_network.my_network.self_link
  region        = var.region
}

resource "google_compute_subnetwork" "grafana_prometheus_subnet" {
  name          = "grafana-prometheus-subnet"
  ip_cidr_range = "30.30.34.0/24"
  network       = google_compute_network.my_network.self_link
  region        = var.region
}

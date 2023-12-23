variable "instance_name" {
  default = "ansiblenodemanager"
}


variable "credentials_file" {
  default = "hehe/credentials.json"
}

resource "google_compute_instance" "ansiblenodemanager" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 20
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.mongodb_subnet.self_link
    network_ip = "30.30.30.1"  
  }

  metadata = {
    startup-script = file("${path.module}/install_ansible.sh")
  }

  labels = {
    environment = "production"
  }

  tags = ["ansible-node-manager"]
}



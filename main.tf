provider "google" {
#  credentials = file("../optical-pillar-279806-8a8df30de4a6.json")
  credentials = var.secret
  project = "tfc4b-test"
  region  = "asia-southeast1"
  zone    = "asia-southeast1-a"
}

#
resource "google_compute_instance" "tfcb" {
  name         = "tfc4b-test"
  machine_type = "f1-micro"
  zone         = "asia-southeast1-a"
#  count        = var.instance_count

metadata = {
#   ssh-keys = "raymond:${file("~/.ssh/id_rsa.pub")}"
   ssh-keys = var.ssh
}
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
 
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask;}"
  
  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config {
    }
  }
}

variable "secret" {
  default = []
}

variable "instance_count" {
  default = "3"
}

variable "ssh" {
  default = []

}


resource "google_compute_network" "vpc_network_tfcb" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}

## Test for qa ###
#resource "google_compute_network" "vpc_network2" {
#  name                    = "terraform-network2"
#  auto_create_subnetworks = "true"
#}


resource "google_compute_firewall" "tfcb" {
 name    = "flask-app-firewall"
 network = "default"

 allow {
   protocol = "tcp"
   ports    = ["5000"]
 }
}

terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "hashicorp-raymond-test"

    workspaces {
      name = "sentinel-test"
    }
  }
}

#output "ip" {
# value = google_compute_instance.default[count.index].network_interface.0.access_config.0.nat_ip
#}

provider "google" {
#  credentials = file("../optical-pillar-279806-8a8df30de4a6.json")
  credentials = var.secret
  project = "optical-pillar-279806"
  region  = "us-central1"
  zone    = "us-central1-c"
}


resource "google_compute_instance" "default" {
  name         = "flask-vm"
  machine_type = "f1-micro"
  zone         = "us-west1-a"

metadata = {
   ssh-keys = "raymond:${file("~/.ssh/id_rsa.pub")}"
}
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
 
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask; python /home/raymond/app.py;}"
  
  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config {
    }
  }
}

data "template_file" "default" {
  template = file("app.py")
}

resource "local_file" "app" {
  content = data.template_file.default.rendered
#  content = "test"
  filename = "/home/raymond/app.py"
}

variable "secret"
{

}
resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}

resource "google_compute_firewall" "default" {
 name    = "flask-app-firewall"
 network = "default"

 allow {
   protocol = "tcp"
   ports    = ["5000"]
 }
}

output "ip" {
 value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}

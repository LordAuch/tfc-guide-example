data "google_compute_image" "ubuntu" {
  most_recent = true
  project     = var.image_project
  family      = var.image_family
}

resource "google_compute_instance" "instance_tf" {
  name         = var.inst_name
  machine_type = var.inst_machine_type

  
  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link
    }
  }
  network_interface {
   subnetwork = google_compute_subnetwork.app-subnet-west1.id
   access_config {
      # Leave empty for dynamic public IP
    }
  }  

  allow_stopping_for_update = true

}

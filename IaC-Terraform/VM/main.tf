resource "google_compute_instance" "instance" {
  name         = var.vm-name
  machine_type = var.machine-type
  zone         = var.zone

   boot_disk {

    initialize_params {
      image = var.vm-image
      labels = {
        my_label = "value"
      }
    }
  }


  network_interface {
    network = var.vpc-name
    subnetwork = var.public-subnet-name

    # access_config {
    #   // Ephemeral public IP
    # }
  }

  
}


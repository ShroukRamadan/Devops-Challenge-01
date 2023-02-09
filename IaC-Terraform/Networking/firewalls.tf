resource "google_compute_firewall" "allow-ssh" {
  
  name    = "allow-ssh"
  network = var.vpc-name
  source_ranges = ["35.235.240.0/20"]


  allow {
    
    protocol = "tcp"
    ports    = ["22"]
  
  }


}


resource "google_compute_firewall" "allow-http" {
  
  # allow http for public subnet only
  name    = "allow-http"
  network = var.vpc-name  
  source_ranges = [google_compute_subnetwork.public_subnet.ip_cidr_range]
  allow {    
    protocol = "tcp"
    ports    = ["80"]
  
  }

}



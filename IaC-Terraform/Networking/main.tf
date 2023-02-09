resource "google_compute_network" "custom-vpc" {
  name = var.vpc-name
  auto_create_subnetworks = var.auto_create_subnetworks

}

#----------------------------------------------------------------


resource "google_compute_subnetwork" "public_subnet" {

  name          = var.public-subnet-name
  ip_cidr_range = var.ips-cider-ranges[0]
  network       = google_compute_network.custom-vpc.id
  region        = var.region

}





resource "google_compute_router" "router" {  
  name    = var.router-name
  region  = google_compute_subnetwork.public_subnet.region
  network = google_compute_network.custom-vpc.id
 
}


resource "google_compute_router_nat" "nat" {
  name                               = var.nat-name
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = var.nat_ip_allocate_option 
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat
  subnetwork {
    name                    = google_compute_subnetwork.public_subnet.id
    source_ip_ranges_to_nat = var.source_ip_ranges_to_nat
  
  }

}


#-------------------------------------------------------------------------------------------------


resource "google_compute_subnetwork" "private_subnet" {  
  name          =  var.private-subnet-name
  ip_cidr_range = var.ips-cider-ranges[1]
  private_ip_google_access = var.private_ip_google_access
  network      = google_compute_network.custom-vpc.id
  region        = var.region

}


#-----------------------------------------------------------------------------


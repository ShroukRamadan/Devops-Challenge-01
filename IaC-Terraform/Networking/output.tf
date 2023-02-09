output "custom-vpc-id" {
    value = google_compute_network.custom-vpc.id
  
}

output "vpc-name" {
    value = google_compute_network.custom-vpc.name
  
}

output "public-subnet-name" {
    value = google_compute_subnetwork.public_subnet.name 
}

output "public-subnet-cider-range" {
    value = google_compute_subnetwork.public_subnet.ip_cidr_range
  
}


output "private-subnet-name" {
    value = google_compute_subnetwork.private_subnet.name
  
}


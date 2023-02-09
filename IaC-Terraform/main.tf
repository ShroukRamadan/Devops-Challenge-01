module "vpc" {
  source = "./Networking"
  vpc-name="custom-vpc"
  auto_create_subnetworks = false
  public-subnet-name = "management-subnet"
  private-subnet-name = "restricted-subnet"
  ips-cider-ranges=["10.0.3.0/24","10.0.6.0/24"]
  nat-name="my-nat"
  router-name = "custom-router"
  region = "us-central1"
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  private_ip_google_access = true
  
}


module "VM" {
  source = "./VM"
  vm-name ="private-vm"
  machine-type = "e2-medium"
  zone         = "us-central1-a"
  vm-image = "debian-cloud/debian-11"
  vpc-name = module.vpc.vpc-name
  public-subnet-name = module.vpc.public-subnet-name

  
}



module "K8S" {
  source = "./K8S"
  cluster-name     = "k8s-cluster"
  cluster-location = "us-central1-a"  
  vpc-name = module.vpc.vpc-name
  private-subnet-name = module.vpc.private-subnet-name
  pub-subnet-cider-range= module.vpc.public-subnet-cider-range
  remove_default_node_pool = true
  initial_node_count       = 2
  issue_client_certificate = false
  enable_private_endpoint = true
  enable_private_nodes    = true
  master_ipv4_cidr_block  = "172.16.0.0/28"
  authorized_networks_name = "management-subnet"
  node_pool_name = "my-node-pool"
  node_pool_location = "us-central1-a"
  node_pool_count = 2
  preemptible  = true
  machine_type = "e2-medium"
  oauth_scopes    = [
    "https://www.googleapis.com/auth/cloud-platform"
  ]
  project_id   = "shrouk-iti-project"
  gcr-location = "US"
  sa_id = "account-gke-project"
  sa-name = "node-sa"
  sa-role = "roles/storage.objectViewer" 
  
}




#--------------------------------------------------------------------------------------

 resource "google_container_cluster" "cluster" {
  
  name     = var.cluster-name
  location = var.cluster-location
  network = var.vpc-name
  subnetwork = var.private-subnet-name

  remove_default_node_pool = var.remove_default_node_pool
  initial_node_count       = var.initial_node_count 


  master_auth {
    client_certificate_config {
      issue_client_certificate = var.issue_client_certificate
  
    }

   }


  private_cluster_config {
  
    enable_private_endpoint = var.enable_private_endpoint
    enable_private_nodes    = var.enable_private_nodes 
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block

  }
  

  ip_allocation_policy {

  }

  master_authorized_networks_config {
      cidr_blocks {
        cidr_block   = var.pub-subnet-cider-range
        display_name = var.authorized_networks_name
      
      }
  
  }

}


resource "google_container_node_pool" "node-pool" {
  name       = var.node_pool_name
  location   = var.node_pool_location
  cluster    = google_container_cluster.cluster.name
  node_count = var.node_pool_count

  node_config {

    preemptible  = var.preemptible
    machine_type = var.machine_type
    service_account = google_service_account.sa-node.email
    oauth_scopes    = var.oauth_scopes
  
  }

}

#---------------------------------------------------------------------------------------------------


resource "google_container_registry" "gke-project-gcr" {
  project  = var.project_id
  location = var.gcr-location

}

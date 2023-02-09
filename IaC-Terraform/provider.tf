provider "google" {
  project     = "shrouk-iti-project"
  #impersonate_service_account = "terraform-sa"
  credentials = file("./shrouk-iti-project-d12b4f3c56e9.json")
  region      = "us-central1"


}



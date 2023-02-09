resource "google_service_account" "sa-node" {
  account_id   = var.sa_id
  display_name = var.sa-name
  project  = var.project_id
}


resource "google_project_iam_member" "sa-roles" {
  role = var.sa-role 
  member = "serviceAccount:${google_service_account.sa-node.email}"
  project  = var.project_id
}

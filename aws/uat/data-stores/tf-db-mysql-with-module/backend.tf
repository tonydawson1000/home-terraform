# Partial Back End / Remote State Store
# Use - terraform init -backend-config=backend.hcl
# Each Terraform Project will specify a unique 'key' to act as the storage location for the .tfstate file
terraform {
  backend "s3" {
    key = "uat/tf-db-mysql-with-module-remote-state/terraform.tfstate"
  }
}
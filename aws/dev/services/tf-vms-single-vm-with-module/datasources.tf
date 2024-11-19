data "terraform_remote_state" "mydevmysqldb" {
  backend = "s3"

  config = {
    region = var.tf_region
    bucket = var.tf_remote_state_s3_bucket_name

    # Key to the Remote State file for our mysql db
    # Which contains 'outputs' for 'db-address' and 'db-port'
    key = "dev/tf-db-mysql-with-module-remote-state/terraform.tfstate"
  }
}
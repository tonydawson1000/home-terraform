data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "terraform_remote_state" "mysqldb" {
  backend = "s3"

  config = {
    region = var.tf_region
    bucket = var.tf_remote_state_s3_bucket_name

    # Key to the Remote State file for our mysql db
    # Which contains 'outputs' for 'db-address' and 'db-port'
    key = "dev/tf-db-mysql-remote-state/terraform.tfstate"
  }
}
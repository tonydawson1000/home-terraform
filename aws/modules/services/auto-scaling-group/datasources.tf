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
    region = var.db_remote_state_region
    bucket = var.db_remote_state_bucket

    # Key to the Remote State file for our mysql db
    # Which contains 'outputs' for 'db-address' and 'db-port'
    key = var.db_remote_state_key
  }
}
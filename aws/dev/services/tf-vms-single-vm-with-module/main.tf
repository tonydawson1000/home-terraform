module "single_ec2_vm" {
  source = "../../../modules/services/single-ec2-vm"

  ec2_vm_name = "tf-ubuntu-vm-for-dev"

  db_remote_state_region = var.db_remote_state_region
  db_remote_state_bucket = var.db_remote_state_bucket
  db_remote_state_key    = var.db_remote_state_key
}
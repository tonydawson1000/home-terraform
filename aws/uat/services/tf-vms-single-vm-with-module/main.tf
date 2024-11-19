module "single_ec2_vm" {
  source = "../../../modules/services/single-ec2-vm"

  security_group_http_in_name = var.security_group_http_in_name
  server_port                 = var.server_port

  ec2_vm_name = var.ec2_vm_name

  db_address = data.terraform_remote_state.myuatmysqldb.outputs.db_address
  db_port    = data.terraform_remote_state.myuatmysqldb.outputs.db_port
}
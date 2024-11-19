module "asg" {
  source = "../../../modules/services/auto-scaling-group"

  security_group_http_in_lb_name = var.security_group_http_in_lb_name
  http_port                      = var.http_port

  security_group_http_in_vms_name = var.security_group_http_in_vms_name
  server_port                     = var.server_port

  auto_scaling_group_name = "tf-asg-uat-vms"

  min_size         = 2
  max_size         = 5
  desired_capacity = 3

  load_balancer_name              = "tf-lb-asg-uat-vms"
  load_balancer_target_group_name = "tf-lb-target-group-asg-uat-vms"

  db_address = data.terraform_remote_state.myuatmysqldb.outputs.db_address
  db_port    = data.terraform_remote_state.myuatmysqldb.outputs.db_port
}
module "asg" {
  source = "../../../modules/services/auto-scaling-group"

  auto_scaling_group_name = "tf-asg-dev-vms"

  min_size         = 2
  max_size         = 5
  desired_capacity = 3

  load_balancer_name = "tf-lb-asg-dev-vms"

  load_balancer_target_group_name = "tf-lb-target-group-asg-dev-vms"

  db_remote_state_region = var.db_remote_state_region
  db_remote_state_bucket = var.db_remote_state_bucket
  db_remote_state_key    = var.db_remote_state_key
}
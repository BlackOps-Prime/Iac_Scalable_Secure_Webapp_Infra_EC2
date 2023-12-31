resource "aws_lb_target_group" "this" {
  name     = "${var.global_var_name_tag_prefix}-app-target-group"
  port     = var.var_app_target_group_listen_port
  protocol = var.var_app_target_group_listen_protocol
  vpc_id   = var.var_app_target_group_vpc_id

  tags = {
    Name = "${var.global_var_name_tag_prefix}-${terraform.workspace}-app-target-group"
  }
}
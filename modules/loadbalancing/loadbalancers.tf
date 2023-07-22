resource "aws_lb" "external" {
  name                       = "${var.global_var_name_tag_prefix}-${terraform.workspace}-alb"
  internal                   = var.var_external_loabalancer_internal
  load_balancer_type         = var.var_external_loabalancer_type
  security_groups            = [var.var_external_loabalancer_security_group]
  subnets                    = var.var_external_loabalancer_subnets
  enable_deletion_protection = var.var_external_loabalancer_enable_deletion

  tags = {
    Name = "${var.global_var_name_tag_prefix}-${terraform.workspace}-external-loadbalancer"
  }
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.external.arn
  port              = var.var_external_loabalancer_listener_port
  protocol          = var.var_external_loabalancer_listener_protocol
  #   ssl_policy        = var.var_external_loabalancer_listener_ssl_policy
  #   certificate_arn   = var.var_external_loabalancer_listener_certificate_arn

  default_action {
    type             = var.var_external_loabalancer_listener_default_action
    target_group_arn = aws_lb_target_group.this.arn
  }
}
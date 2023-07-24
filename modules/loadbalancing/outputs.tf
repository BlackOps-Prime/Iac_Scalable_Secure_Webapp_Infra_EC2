output "external_loadbalancer_id" {
  value = aws_lb.external.dns_name
}

output "app_target_group_arn" {
  value = aws_lb_target_group.this.arn
}
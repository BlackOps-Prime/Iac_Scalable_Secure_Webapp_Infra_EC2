resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.this.zone_id
  name    = var.global_var_dns_record_name
  type    = var.global_var_dns_record_type
  ttl     = var.global_var_dns_record_prpagation_ttl
  records = [var.global_var_dns_record_target]
}
resource "aws_route53_zone" "this" {
  name = var.global_var_dns_domain

  tags = {
    Name = "${var.global_var_name_tag_prefix}-${terraform.workspace}-${var.global_var_dns_domain}-hosted-zone"
  }
}

resource "aws_vpc" "this" {
  cidr_block           = "${lookup(var.var_vpc_cidr_block_prefixes, terraform.workspace)}.0.0/16"
  enable_dns_hostnames = var.var_vpc_enable_dns_hostnames

  tags = {
    Name = "${var.global_var_name_tag_prefix}-${terraform.workspace}-vpc"
  }
}
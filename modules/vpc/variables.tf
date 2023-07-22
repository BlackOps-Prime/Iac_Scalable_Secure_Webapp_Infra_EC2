variable "var_vpc_cidr_block_prefixes" {
  type        = map(string)
  description = "Default CIDR block for VPC"
  default = {
    development = "172.10"
    staging     = "172.50"
    production  = "172.100"
  }
}

variable "var_vpc_enable_dns_hostnames" {
  type        = bool
  description = "enable or disable dns vpc hostnames"
}

variable "global_var_name_tag_prefix" {
  type        = string
  description = "main project identifier"
}

data "aws_availability_zones" "this" {
  state = "available"
}

locals {

  database_subnets_cidr = [
    "${lookup(var.var_vpc_cidr_block_prefixes, terraform.workspace)}.1.0/24",
    "${lookup(var.var_vpc_cidr_block_prefixes, terraform.workspace)}.2.0/24",
    "${lookup(var.var_vpc_cidr_block_prefixes, terraform.workspace)}.3.0/24"
  ]

  private_subnets_cidr = [
    "${lookup(var.var_vpc_cidr_block_prefixes, terraform.workspace)}.4.0/24",
    "${lookup(var.var_vpc_cidr_block_prefixes, terraform.workspace)}.5.0/24",
    "${lookup(var.var_vpc_cidr_block_prefixes, terraform.workspace)}.6.0/24"
  ]

  public_subnets_cidr = [
    "${lookup(var.var_vpc_cidr_block_prefixes, terraform.workspace)}.7.0/24",
    "${lookup(var.var_vpc_cidr_block_prefixes, terraform.workspace)}.8.0/24",
    "${lookup(var.var_vpc_cidr_block_prefixes, terraform.workspace)}.9.0/24"
  ]

  availability_zones = data.aws_availability_zones.this.names

}

variable "var_gateway_eip_domain" {
  type        = string
  description = "elastic ip domain"
}


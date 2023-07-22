output "main_vpc_id" {
  value = aws_vpc.this.id
}

output "Jumpbox_eip" {

  value = aws_eip.Jumpbox_eip.private_ip
}

output "public_nat_gateway_subnets" {
  value = aws_subnet.public_nat_gateway_subnets[*]
}

output "private_app_subnets" {
  value = aws_subnet.private_app_subnets[*].id
}

output "region_availability_zones" {
  value = local.availability_zones
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id


  tags = {
    Name = "${var.global_var_name_tag_prefix}-${terraform.workspace}-internet-gateway"
  }
}

# Elastic IPs for NAT Gateways
resource "aws_eip" "nat_eip" {
  depends_on = [aws_internet_gateway.this]
  domain     = var.var_gateway_eip_domain

  tags = {
    Name = "${var.global_var_name_tag_prefix}-${terraform.workspace}-nat-eip"
  }
}

# Elastic IPs for Bastian Host or JumpBox
resource "aws_eip" "Jumpbox_eip" {
  depends_on = [aws_internet_gateway.this]
  domain     = var.var_gateway_eip_domain

  tags = {
    Name = "${var.global_var_name_tag_prefix}-${terraform.workspace}-Jumpbox_eip"
  }
}


# NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_nat_gateway_subnets[0].id

  tags = {
    Name = "${var.global_var_name_tag_prefix}-${terraform.workspace}-public-nat-gateway"
  }
}

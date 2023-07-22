resource "aws_route_table" "databse_subnet_route_table" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.global_var_name_tag_prefix}-${terraform.workspace}-database-subnet-route-table"
  }
}

resource "aws_route_table" "private_app_subnet_route_table" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.global_var_name_tag_prefix}-${terraform.workspace}-private-app-subnet-route-table"
  }
}

resource "aws_route_table" "pubic_app_subnet_route_table" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.global_var_name_tag_prefix}-${terraform.workspace}-public-app-subnet-route-table"
  }
}


# Associating Route Tables With Subnets
resource "aws_route_table_association" "database_subnet_route_table_association" {
  count          = length(local.database_subnets_cidr)
  subnet_id      = element(aws_subnet.database_subnets.*.id, count.index)
  route_table_id = aws_route_table.databse_subnet_route_table.id
}

resource "aws_route_table_association" "private_app_subnet_route_table_association" {
  count          = length(local.private_subnets_cidr)
  subnet_id      = element(aws_subnet.private_app_subnets.*.id, count.index)
  route_table_id = aws_route_table.private_app_subnet_route_table.id
}

resource "aws_route_table_association" "public_natgateway_subnet_route_table_association" {
  count          = length(local.public_subnets_cidr)
  subnet_id      = element(aws_subnet.public_nat_gateway_subnets.*.id, count.index)
  route_table_id = aws_route_table.pubic_app_subnet_route_table.id
}

# Creating Routes For Subnets

# Private route table connects to Nat Gateway
resource "aws_route" "private_nat_gateway_route" {

  route_table_id         = aws_route_table.private_app_subnet_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id

  depends_on = [ aws_nat_gateway.nat_gateway ]
}

# Public route table connects to internet gateway
resource "aws_route" "public_internet_gateway_route" {
  route_table_id         = aws_route_table.pubic_app_subnet_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}


resource "aws_subnet" "database_subnets" {
  count             = length(local.database_subnets_cidr)
  vpc_id            = aws_vpc.this.id
  cidr_block        = element(local.database_subnets_cidr, count.index)
  availability_zone = element(local.availability_zones, count.index)
  depends_on        = [aws_vpc.this]


  tags = {
    Name = "${var.global_var_name_tag_prefix}-${terraform.workspace}-${element(local.availability_zones, count.index)}-database-subnet"
  }

}

resource "aws_subnet" "private_app_subnets" {
  count             = length(local.private_subnets_cidr)
  vpc_id            = aws_vpc.this.id
  cidr_block        = element(local.private_subnets_cidr, count.index)
  availability_zone = element(local.availability_zones, count.index)
  depends_on        = [aws_vpc.this]


  tags = {
    Name = "${var.global_var_name_tag_prefix}-${terraform.workspace}-${element(local.availability_zones, count.index)}-private-app-subnet"
  }

}

resource "aws_subnet" "public_nat_gateway_subnets" {
  count             = length(local.public_subnets_cidr)
  vpc_id            = aws_vpc.this.id
  cidr_block        = element(local.public_subnets_cidr, count.index)
  availability_zone = element(local.availability_zones, count.index)
  depends_on        = [aws_vpc.this]


  tags = {
    Name = "${var.global_var_name_tag_prefix}-${terraform.workspace}-${element(local.availability_zones, count.index)}-public-nat-gateway-subnet"
  }

}
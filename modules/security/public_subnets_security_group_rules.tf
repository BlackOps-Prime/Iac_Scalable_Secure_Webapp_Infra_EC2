resource "aws_security_group" "public_subnet_traffic_rules" {
  name        = "${var.global_var_name_tag_prefix}-${terraform.workspace}-public-subnet-security-group"
  description = "Allow Traffic To and From Public Subnet"
  vpc_id      = var.var_main_vpc_id


  tags = {
    Name = "${var.global_var_name_tag_prefix}-${terraform.workspace}-public-subnets-security-group"
  }
}

resource "aws_security_group_rule" "allow_inbound_traffic_into_public_subnet" {
  type              = var.var_public_subnet_allow_http_traffic_type
  from_port         = var.var_public_subnet_security_group_ingress_port
  to_port           = var.var_public_subnet_security_group_ingress_port
  protocol          = var.var_public_subnet_security_group_ingress_protocol
  cidr_blocks       = [var.var_public_subnet_security_group_ingress_cidr]
  security_group_id = aws_security_group.public_subnet_traffic_rules.id
}

resource "aws_security_group_rule" "allow_egress_traffic_for_public_subnet" {
  type              = var.var_public_subnet_allow_egress_traffic
  from_port         = var.var_public_subnet_security_group_egress_port
  to_port           = var.var_public_subnet_security_group_egress_port
  protocol          = var.var_public_subnet_security_group_egress_protocol
  cidr_blocks       = [var.var_public_subnet_security_group_egress_cidr]
  security_group_id = aws_security_group.public_subnet_traffic_rules.id
}

resource "aws_security_group_rule" "allow_ssh_inbound_traffic_into_jumpbox" {
  type              = var.var_public_subnet_allow_http_traffic_type
  from_port         = var.var_public_subnet_security_group_jumpbox_ingress_port
  to_port           = var.var_public_subnet_security_group_jumpbox_ingress_port
  protocol          = var.var_public_subnet_security_group_ingress_protocol
  cidr_blocks       = [var.var_public_subnet_security_group_ingress_cidr]
  security_group_id = aws_security_group.public_subnet_traffic_rules.id
}
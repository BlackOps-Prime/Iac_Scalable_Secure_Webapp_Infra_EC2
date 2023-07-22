resource "aws_security_group" "application_traffic_rules" {
  name        = "${var.global_var_name_tag_prefix}-${terraform.workspace}-app-security-group"
  description = "Allow Traffic To and From App Subnet"
  vpc_id      = var.var_main_vpc_id



  tags = {
    Name = "${var.global_var_name_tag_prefix}-${terraform.workspace}-app-subnets-security-group"
  }

}

resource "aws_security_group_rule" "allow_http_inbound_traffic_into_app_subnet" {
  type              = var.var_application_subnet_allow_http_traffic
  from_port         = var.var_app_security_group_http_ingress_port
  to_port           = var.var_app_security_group_http_ingress_port
  protocol          = var.var_app_security_group_http_ingress_protocol
  security_group_id = aws_security_group.application_traffic_rules.id
  source_security_group_id = aws_security_group.public_subnet_traffic_rules.id
}

resource "aws_security_group_rule" "allow_jumpbox" {
  type              = var.var_application_subnet_allow_http_traffic
  from_port         = var.var_app_security_group_allow_jumpbox_from_port
  to_port           = var.var_app_security_group_allow_jumpbox_to_port
  protocol          = var.var_app_security_group_http_ingress_protocol
  cidr_blocks       = [var.var_ec2_jumpbox_elastic_ip]
  security_group_id = aws_security_group.application_traffic_rules.id
}


resource "aws_security_group_rule" "allow_http_egress_traffic_for_app_subnet" {
  type              = var.var_application_subnet_allow_egress_traffic
  from_port         = var.var_app_security_group_egress_port
  to_port           = var.var_app_security_group_egress_port
  protocol          = var.var_app_security_group_egress_protocol
  cidr_blocks       = [var.var_app_security_group_egress_cidr]
  security_group_id = aws_security_group.application_traffic_rules.id
}
resource "aws_security_group" "database_traffic_rules" {
  name        = "${var.global_var_name_tag_prefix}-${terraform.workspace}-rds-security-group"
  description = "Allow Traffic To and From DB Subnet"
  vpc_id      = var.var_main_vpc_id

  tags = {
    Name = "${var.global_var_name_tag_prefix}-${terraform.workspace}-rds-subnets-security-group"
  }
}

resource "aws_security_group_rule" "allow_inbound_traffic_into_database_subnet" {
  type                     = var.var_database_subnet_allow_http_traffic_type
  from_port                = var.var_db_security_group_main_rds_ingress_port
  to_port                  = var.var_db_security_group_main_rds_ingress_port
  protocol                 = var.var_db_security_group_ingress_protocol
  security_group_id        = aws_security_group.database_traffic_rules.id
  source_security_group_id = aws_security_group.application_traffic_rules.id
}

resource "aws_security_group_rule" "allow_jumpbox_to_database" {
  type              = var.var_application_subnet_allow_http_traffic
  from_port         = var.var_app_security_group_allow_jumpbox_from_port
  to_port           = var.var_app_security_group_allow_jumpbox_to_port
  protocol          = var.var_app_security_group_http_ingress_protocol
  cidr_blocks       = [var.var_ec2_jumpbox_elastic_ip]
  security_group_id = aws_security_group.database_traffic_rules.id
}

resource "aws_security_group_rule" "allow_egress_traffic_for_db_subnet" {
  type              = var.var_database_subnet_egress_http_traffic_type
  from_port         = var.var_db_security_group_main_rds_egress_port
  to_port           = var.var_db_security_group_main_rds_egress_port
  protocol          = var.var_db_security_group_egress_protocol
  cidr_blocks       = [var.var_app_security_group_egress_cidr]
  security_group_id = aws_security_group.database_traffic_rules.id
}
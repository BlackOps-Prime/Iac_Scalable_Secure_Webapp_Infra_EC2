variable "var_main_vpc_id" {
  description = "Main VPC ID"
}

variable "global_var_name_tag_prefix" {
  type        = string
  description = "main project identifier"
}

variable "var_ec2_jumpbox_elastic_ip" {
  description = "JumpBox Eleastic IP Address"
}

variable "var_db_security_group_main_rds_ingress_port" {
  type        = number
  description = "Main RDS Ingres Port"
}

variable "var_db_security_group_ingress_protocol" {
  type        = string
  description = "Main RDS security group Ingress protocol"
}

variable "var_db_security_group_main_rds_egress_port" {
  type        = number
  default     = 0
  description = "Main RDS Egress Port"
}

variable "var_db_security_group_egress_protocol" {
  type        = string
  default     = "-1"
  description = "Main RDS security group Egress protocol"
}

variable "var_db_security_group_egress_cidr" {
  type        = string
  default     = "0.0.0.0/0"
  description = "Main RDS security group Egress CIDR" #Can be limited based on network or firewall policies
}

variable "var_app_security_group_http_ingress_port" {
  type        = number
  description = "Main App Ingres Port"
}

variable "var_app_security_group_http_ingress_protocol" {
  type        = string
  description = "Main App security group Ingress protocol"
}

variable "var_app_security_group_egress_port" {
  type        = number
  default     = 0
  description = "Main App Egress Port"
}

variable "var_app_security_group_egress_protocol" {
  type        = string
  default     = "-1"
  description = "Main App security group Egress protocol"
}

variable "var_app_security_group_egress_cidr" {
  type        = string
  default     = "0.0.0.0/0"
  description = "Main RDS security group Egress CIDR" #Can be limited based on network or firewall policies
}

variable "var_public_subnet_security_group_ingress_port" {
  type        = number
  description = "Public Subnet Ingres Port"
}

variable "var_public_subnet_security_group_ingress_protocol" {
  type        = string
  description = "Public Subnet security group Ingress protocol"
}

variable "var_public_subnet_security_group_ingress_cidr" {
  type        = string
  default     = "0.0.0.0/0"
  description = "Public Subnet security group Igress CIDR" #Can be limited based on network or firewall policies
}

variable "var_public_subnet_security_group_egress_port" {
  type        = number
  default     = 0
  description = "Public Subnet Egress Port"
}

variable "var_public_subnet_security_group_egress_protocol" {
  type        = string
  default     = "-1"
  description = "Public Subnet security group Egress protocol"
}

variable "var_public_subnet_security_group_egress_cidr" {
  type        = string
  default     = "0.0.0.0/0"
  description = "Public Subnet security group Egress CIDR" #Can be limited based on network or firewall policies
}

variable "var_application_subnet_allow_http_traffic" {
  type        = string
  description = "Allow HTTP Inbound Traffic Into App Subnet"
}

variable "var_application_subnet_allow_egress_traffic" {
  type        = string
  description = "Allow Egress Traffic Out Of  App Subnet"
}

variable "var_app_security_group_allow_jumpbox_from_port" {
  type        = number
  description = "Main App Ingres From Port For Jumpbox"
}

variable "var_app_security_group_allow_jumpbox_to_port" {
  type        = number
  description = "Main App Ingres To Port For Jumpbox"
}

variable "var_public_subnet_allow_http_traffic_type" {
  type        = string
  description = "Allow HTTP Inbound Traffic Into public Subnet"
}

variable "var_public_subnet_allow_egress_traffic" {
  type        = string
  description = "Allow HTTP Egress Traffic out of public Subnet"
}

variable "var_database_subnet_allow_http_traffic_type" {
  type        = string
  description = "Allow HTTP Inbound Traffic Into Database Subnet"
}

variable "var_database_subnet_egress_http_traffic_type" {
  type        = string
  description = "Allow HTTP Egress Traffic Out Of Database Subnet"
}

variable "var_public_subnet_security_group_jumpbox_ingress_port" {
  type        = number
  default = 22
  description = "Public Subnet Jumpbox Ingres Port"
}

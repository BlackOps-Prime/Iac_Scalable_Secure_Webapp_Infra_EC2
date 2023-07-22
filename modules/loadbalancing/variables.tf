variable "global_var_name_tag_prefix" {
  type        = string
  description = "main project identifier"
}

variable "var_external_loabalancer_internal" {
  type        = bool
  default     = false
  description = "Loadbalancer internal or external status"
}

variable "var_external_loabalancer_type" {
  type        = string
  default     = "application"
  description = "Loadbalancer type"
}

variable "var_external_loabalancer_security_group" {
  description = "Loadbalancer security group"
}

variable "var_external_loabalancer_subnets" {
  description = "Loadbalancer subnets"
}

variable "var_external_loabalancer_enable_deletion" {
  default     = false
  description = "Loadbalancer enable deletion switch"
}

variable "var_external_loabalancer_listener_port" {
  description = "Loadbalancer listener port"
}

variable "var_external_loabalancer_listener_protocol" {
  description = "Loadbalancer listener protocol"
}

# variable "var_external_loabalancer_listener_ssl_policy" {
#   default = "ELBSecurityPolicy-2016-08"
#   description = "Loadbalancer listener ssl policy"
# }

# variable "var_external_loabalancer_listener_certificate_arn" {
#   default = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"  #this is just a sample for reference. It is commented becaue HTTP protocol is being used.
#   description = "Loadbalancer listener ssl certificate arn"
# }

variable "var_external_loabalancer_listener_default_action" {
  default     = "forward"
  description = "Loadbalancer listener default_action"
}

variable "var_app_target_group_listen_port" {
  description = "Application target group listen port"
}

variable "var_app_target_group_listen_protocol" {
  description = "Application target group listen protocol"
}

variable "var_app_target_group_vpc_id" {
  description = "Application target group vpc id"
}

# variable "var_app_target_group_attachment_port" {
#   description = "Application target group attachment port"
# }

# variable "var_app_target_group_attachment_target" {
#   description = "Application target group attachment targets"
# }
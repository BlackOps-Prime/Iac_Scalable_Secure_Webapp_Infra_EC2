variable "global_var_dns_domain" {
  description = "route 53 hosted zone"
}

variable "global_var_name_tag_prefix" {
  type        = string
  description = "main project identifier"
}

variable "global_var_dns_record_name" {
  type        = string
  description = "DNS record name"
}

variable "global_var_dns_record_type" {
  type        = string
  description = "DNS record type"
}

variable "global_var_dns_record_prpagation_ttl" {
  type        = string
  description = "DNS record propagation ttl"
}

variable "global_var_dns_record_target" {
  type        = string
  description = "DNS record target"
}
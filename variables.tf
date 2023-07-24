variable "global_var_ird_region" {}

variable "global_var_aws_profile" {}

variable "var_vpc_enable_dns_hostnames" {}

variable "global_var_name_tag_prefix" {}

variable "var_gateway_eip_domain" {}

variable "var_db_security_group_main_rds_ingress_port" {}

variable "var_db_security_group_ingress_protocol" {}

variable "var_app_security_group_http_ingress_port" {}

variable "var_app_security_group_http_ingress_protocol" {}

variable "var_public_subnet_security_group_ingress_port" {}

variable "var_public_subnet_security_group_ingress_protocol" {}

variable "var_external_loabalancer_listener_port" {}

variable "var_external_loabalancer_listener_protocol" {}

variable "var_app_target_group_listen_port" {}

variable "var_app_target_group_listen_protocol" {}

variable "var_ec2_instance_type" {}

variable "var_app_ec2_associate_public_ip" {}

variable "var_ec2_instances_count" {}

variable "var_ec2_instance_ebs_optimized" {}

variable "var_ec2_ebs_volume_size" {}

variable "var_ec2_ebs_volume_type" {}

variable "var_ec2_instance_monitoring_enabled" {}

variable "var_ec2_instance_profile_name" {}

variable "var_ec2_instance_key_pair_name" {}

variable "var_ec2_app_instance_purpose" {}

variable "var_ec2_jumpbox_instance_purpose" {}

variable "var_jumpbox_ec2_associate_public_ip" {}

variable "global_var_dns_domain" {}

variable "global_var_dns_record_name" {}

variable "global_var_dns_record_type" {}

variable "global_var_dns_record_prpagation_ttl" {}

variable "var_rds_cluster_aurora_manage_master_password" {}

variable "var_rds_cluster_aurora_master_username" {}

variable "var_rds_cluster_aurora_database_name" {}

variable "var_rds_cluster_aurora_instance_class" {}

variable "var_rds_cluster_aurora_instance_count" {}

variable "var_rds_cluster_engine" {}

variable "var_rds_cluster_storage_type" {}

variable "var_rds_cluster_allocated_storage" {}

variable "var_rds_cluster_storage_ios" {}

variable "var_rds_cluster_aurora_availability_zones" {}

variable "var_rds_cluster_port" {}

variable "var_rds_skip_final_snapshot" {}

variable "var_rds_apply_changes_immediately" {}

variable "var_application_subnet_allow_http_traffic" {}

variable "var_application_subnet_allow_egress_traffic" {}

variable "var_app_security_group_allow_jumpbox_from_port" {}


variable "var_app_security_group_allow_jumpbox_to_port" {}

variable "var_public_subnet_allow_http_traffic_type" {}

variable "var_public_subnet_allow_egress_traffic" {}

variable "var_database_subnet_allow_http_traffic_type" {}

variable "var_database_subnet_egress_http_traffic_type" {}

# variable "var_ec2_autoscalling_image_ami" {}
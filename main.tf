# Author: Christopher Junior Afeku
# Description: A Terraform script to create the required resources according to the requirements of the attached architecture Diagram for this project.
# Usage:
#   * Initialize the project by running `terraform init`
#   * Create or switch to an existing workspace. Eg: `terraform workspace new development` or `terraform workspace select development`
#   * Run `terraform plan` to and validate the printed out results.
#   * Run `terraform apply` to create the resources for the underlying infrastructure.
#   * You may also run `terraform apply` to update the deployed resources after making needed changes to this iac project.
# Date Created: 16th July 2023
# Last Modified: 16th July, 2023


module "vpc" {
  source = "./modules/vpc"

  var_vpc_enable_dns_hostnames = var.var_vpc_enable_dns_hostnames
  global_var_name_tag_prefix   = var.global_var_name_tag_prefix
  var_gateway_eip_domain       = var.var_gateway_eip_domain
}


module "security_groups" {
  source = "./modules/security"

  var_main_vpc_id                                   = module.vpc.main_vpc_id
  global_var_name_tag_prefix                        = var.global_var_name_tag_prefix
  var_ec2_jumpbox_elastic_ip                        = "${module.bastian_host.ec2_instances_private_ip}/32"
  var_app_security_group_http_ingress_port               = var.var_app_security_group_http_ingress_port
  var_app_security_group_http_ingress_protocol           = var.var_app_security_group_http_ingress_protocol
  var_application_subnet_allow_http_traffic = var.var_application_subnet_allow_http_traffic
  var_application_subnet_allow_egress_traffic = var.var_application_subnet_allow_egress_traffic
  var_app_security_group_allow_jumpbox_from_port = var.var_app_security_group_allow_jumpbox_from_port
  var_app_security_group_allow_jumpbox_to_port = var.var_app_security_group_allow_jumpbox_to_port
  var_public_subnet_allow_http_traffic_type = var.var_public_subnet_allow_http_traffic_type
  var_public_subnet_security_group_ingress_port     = var.var_public_subnet_security_group_ingress_port
  var_public_subnet_security_group_ingress_protocol = var.var_public_subnet_security_group_ingress_protocol
  var_public_subnet_allow_egress_traffic = var.var_public_subnet_allow_egress_traffic
  var_database_subnet_allow_http_traffic_type = var.var_database_subnet_allow_http_traffic_type
  var_db_security_group_main_rds_ingress_port       = var.var_db_security_group_main_rds_ingress_port
  var_db_security_group_ingress_protocol            = var.var_db_security_group_ingress_protocol
  var_database_subnet_egress_http_traffic_type = var.var_database_subnet_egress_http_traffic_type



  depends_on = [module.vpc]
}


module "loadbalancing" {
  source = "./modules/loadbalancing"

  global_var_name_tag_prefix                 = var.global_var_name_tag_prefix
  var_external_loabalancer_security_group    = module.security_groups.public_subnets_security_group_id
  var_external_loabalancer_subnets           = [for subnet in module.vpc.public_nat_gateway_subnets : subnet.id]
  var_external_loabalancer_listener_port     = var.var_external_loabalancer_listener_port
  var_external_loabalancer_listener_protocol = var.var_external_loabalancer_listener_protocol
  var_app_target_group_listen_port           = var.var_app_target_group_listen_port
  var_app_target_group_listen_protocol       = var.var_app_target_group_listen_protocol
  var_app_target_group_vpc_id                = module.vpc.main_vpc_id


  depends_on = [module.vpc, module.security_groups ]
}

module "iam" {
  source = "./modules/iam"

  global_var_name_tag_prefix    = var.global_var_name_tag_prefix
  var_ec2_instance_profile_name = var.var_ec2_instance_profile_name
}

# module "app_instances" {
#   source = "./modules/ec2"

#   count                               = var.var_ec2_instances_count
#   global_var_name_tag_prefix          = var.global_var_name_tag_prefix
#   var_ec2_instance_type               = var.var_ec2_instance_type
#   var_ec2_associate_public_ip         = var.var_app_ec2_associate_public_ip
#   var_ec2_availability_zones          = element(module.vpc.region_availability_zones, count.index)
#   var_ec2_instance_ebs_optimized      = var.var_ec2_instance_ebs_optimized
#   var_ec2_iam_instance_profile        = module.iam.ec2_instance_profile
#   var_ec2_instance_key_pair_name      = var.var_ec2_instance_key_pair_name
#   var_ec2_instance_security_groups    = [module.security_groups.private_subnets_security_group_id]
#   var_ec2_instance_subnet_id          = "${element(module.vpc.private_app_subnets, count.index)}"
#   var_ec2_ebs_volume_size             = var.var_ec2_ebs_volume_size
#   var_ec2_ebs_volume_type             = var.var_ec2_ebs_volume_type
#   var_ec2_instance_monitoring_enabled = var.var_ec2_instance_monitoring_enabled
#   var_ec2_instance_purpose = var.var_ec2_app_instance_purpose



#   depends_on = [module.vpc, module.security_groups, module.iam]
# }

module "bastian_host" {
  source = "./modules/ec2"

  global_var_name_tag_prefix          = var.global_var_name_tag_prefix
  var_ec2_instance_purpose = var.var_ec2_jumpbox_instance_purpose
  var_ec2_instance_type               = var.var_ec2_instance_type
  var_ec2_associate_public_ip         = var.var_jumpbox_ec2_associate_public_ip
  var_ec2_availability_zones          = "${module.vpc.region_availability_zones[2]}"
  var_ec2_instance_ebs_optimized      = var.var_ec2_instance_ebs_optimized
  var_ec2_iam_instance_profile        = module.iam.ec2_instance_profile
  var_ec2_instance_key_pair_name      = var.var_ec2_instance_key_pair_name
  var_ec2_instance_security_groups    = [module.security_groups.public_subnets_security_group_id]
  var_ec2_instance_subnet_id          = "${module.vpc.public_nat_gateway_subnets[2].id}"
  var_ec2_ebs_volume_size             = var.var_ec2_ebs_volume_size
  var_ec2_ebs_volume_type             = var.var_ec2_ebs_volume_type
  var_ec2_instance_monitoring_enabled = var.var_ec2_instance_monitoring_enabled




  depends_on = [module.vpc, module.iam]
}

module "dns" {
  source = "./modules/dns"

  global_var_dns_domain = var.global_var_dns_domain
  global_var_name_tag_prefix = var.global_var_name_tag_prefix
  global_var_dns_record_name = var.global_var_dns_record_name
  global_var_dns_record_type = var.global_var_dns_record_type
  global_var_dns_record_prpagation_ttl = var.global_var_dns_record_prpagation_ttl
  global_var_dns_record_target = module.loadbalancing.external_loadbalancer_id

  depends_on = [ module.loadbalancing ]
}

module "rds" {
  source = "./modules/rds"

#   Note to self: Remember to use Hashicorp vault to store and retrieve Master credentials
  var_rds_cluster_aurora_manage_master_password = var.var_rds_cluster_aurora_manage_master_password
  global_var_name_tag_prefix =var.global_var_name_tag_prefix
  var_rds_cluster_aurora_master_username = var.var_rds_cluster_aurora_master_username
  var_rds_cluster_aurora_database_name = var.var_rds_cluster_aurora_database_name
  var_rds_cluster_aurora_availability_zones = var.var_rds_cluster_aurora_availability_zones
  var_rds_cluster_aurora_instance_class = var.var_rds_cluster_aurora_instance_class
  var_rds_cluster_engine = var.var_rds_cluster_engine
  var_rds_cluster_storage_type = var.var_rds_cluster_storage_type
  var_rds_cluster_allocated_storage = var.var_rds_cluster_allocated_storage
  var_rds_cluster_storage_ios = var.var_rds_cluster_storage_ios
  var_rds_subnet_group_member_ids = [module.vpc.private_app_subnets[0], module.vpc.private_app_subnets[1], module.vpc.private_app_subnets[2]]
  var_rds_cluster_port = var.var_rds_cluster_port
  var_rds_skip_final_snapshot = var.var_rds_skip_final_snapshot
  rds_vpc_security_group_id = module.security_groups.database_subnets_security_group_id
  var_rds_apply_changes_immediately = var.var_rds_apply_changes_immediately

}

resource "aws_eip_association" "jumpbox_association" {
#   instance_id   = module.bastian_host.ec2_instances_ids
  instance_id   = "${join("\",\"",  module.bastian_host.ec2_instances_ids)}"
  allocation_id = module.vpc.Jumpbox_eip
}


module "ec2_autoscalling" {
  source = "./modules/autoscalling"

  global_var_name_tag_prefix = var.global_var_name_tag_prefix
  var_ec2_instance_purpose = var.var_ec2_app_instance_purpose
  var_ec2_instance_type = var.var_ec2_instance_type
  var_asg_traffic_source_identifier = module.loadbalancing.app_target_group_arn
  var_asg_security_group_id = module.security_groups.private_subnets_security_group_id
  var_asg_vpc_zone_subnets_identifier = [for subnet in module.vpc.private_app_subnets : tostring(subnet)]
  var_ec2_instance_key_pair_name = var.var_ec2_instance_key_pair_name
  var_ec2_instance_profile_name = var.var_ec2_instance_profile_name
}
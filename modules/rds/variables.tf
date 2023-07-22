variable "global_var_name_tag_prefix" {
  type        = string
  description = "main project identifier"
}

variable "var_rds_cluster_aurora_manage_master_password" {
  type        = string
  description = "RDS Aurora Master Password"
}

variable "var_rds_cluster_aurora_master_username" {
  type        = string
  description = "RDS Aurora Master username"
}

variable "var_rds_cluster_aurora_database_name" {
  type        = string
  description = "RDS Aurora DBName"
}

variable "var_rds_cluster_aurora_availability_zones" {
  description = "RDS Aurora AZs"
}

variable "var_rds_cluster_aurora_instance_class" {
  type        = string
  description = "RDS Aurora Instance class"
}

variable "var_rds_cluster_engine" {
  type        = string
  description = "RDS Aurora Cluster Engine"
}

variable "var_rds_cluster_storage_type" {
  type        = string
  description = "RDS Aurora Cluster Storage Type"
}

variable "var_rds_cluster_allocated_storage" {
  type        = string
  description = "RDS Aurora Cluster Allocated Storage"
}

variable "var_rds_cluster_storage_ios" {
  type        = string
  description = "RDS Aurora Cluster IOPS"
}

variable "var_rds_subnet_group_member_ids" {
  description = "RDS Aurora Cluster DB subnet group member ids"
}

variable "var_rds_cluster_port" {
  description = "RDS Aurora Cluster port"
}

variable "var_rds_skip_final_snapshot" {
  description = "RDS Aurora Cluster skip final snapshot"
}

variable "rds_vpc_security_group_id" {
  description = "RDS Aurora Cluster security group id"
}

variable "var_rds_apply_changes_immediately" {
  description = "RDS Aurora Cluster Apply Changes Immediately"
}


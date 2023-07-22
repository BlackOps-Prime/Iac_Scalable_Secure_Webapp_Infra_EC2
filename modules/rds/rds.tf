resource "aws_rds_cluster" "this" {
  cluster_identifier = "${var.global_var_name_tag_prefix}-${terraform.workspace}-rds-cluster"
  availability_zones = var.var_rds_cluster_aurora_availability_zones
  engine    = var.var_rds_cluster_engine
  db_cluster_instance_class = var.var_rds_cluster_aurora_instance_class
  storage_type = var.var_rds_cluster_storage_type
  allocated_storage = var.var_rds_cluster_allocated_storage
  iops = var.var_rds_cluster_storage_ios
  database_name      = var.var_rds_cluster_aurora_database_name
  master_username    = var.var_rds_cluster_aurora_master_username
  manage_master_user_password    = var.var_rds_cluster_aurora_manage_master_password
  db_subnet_group_name = aws_db_subnet_group.this.name
  port = var.var_rds_cluster_port
  skip_final_snapshot = var.var_rds_skip_final_snapshot
  vpc_security_group_ids = [var.rds_vpc_security_group_id]
  apply_immediately = var.var_rds_apply_changes_immediately


  tags = {
    Name = "${var.global_var_name_tag_prefix}-${terraform.workspace}-rds-cluster"
  }
}

resource "aws_db_subnet_group" "this" {
  name       = "${var.global_var_name_tag_prefix}-${terraform.workspace}-db-subnet-group"
  subnet_ids = var.var_rds_subnet_group_member_ids

  tags = {
    Name = "${var.global_var_name_tag_prefix}-${terraform.workspace}-db-subnet-group"
  }
}
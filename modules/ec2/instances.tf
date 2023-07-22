
resource "aws_instance" "this" {
  ami                         = data.aws_ami.ubuntu_20_04.id
  instance_type               = var.var_ec2_instance_type
  associate_public_ip_address = var.var_ec2_associate_public_ip
  availability_zone           = var.var_ec2_availability_zones
  ebs_optimized               = var.var_ec2_instance_ebs_optimized
  iam_instance_profile        = var.var_ec2_iam_instance_profile
  key_name                    = var.var_ec2_instance_key_pair_name
  monitoring                  = var.var_ec2_instance_monitoring_enabled
  security_groups             = var.var_ec2_instance_security_groups
  subnet_id                   = var.var_ec2_instance_subnet_id

  root_block_device {
    delete_on_termination = var.var_ec2_ebs_volume_delete_on_termintion
    encrypted             = var.var_ec2_ebs_volume_encryption
    volume_size           = var.var_ec2_ebs_volume_size
    volume_type           = var.var_ec2_ebs_volume_type


    tags = {
      Name = "${var.global_var_name_tag_prefix}-${terraform.workspace}-ebs-volume"
    }
  }



  tags = {
    Name = "${var.global_var_name_tag_prefix}-${terraform.workspace}-${var.var_ec2_instance_purpose}-instance"
  }
}


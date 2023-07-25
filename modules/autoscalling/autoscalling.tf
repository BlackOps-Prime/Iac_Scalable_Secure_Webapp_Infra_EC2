resource "aws_launch_template" "this" {
  name_prefix            = "${var.global_var_name_tag_prefix}-${terraform.workspace}-${var.var_ec2_instance_purpose}"
  image_id               = data.aws_ami.ubuntu_20_04.id
  instance_type          = var.var_ec2_instance_type
  vpc_security_group_ids = [var.var_asg_security_group_id]
  key_name               = var.var_ec2_instance_key_pair_name
  user_data              = filebase64("${path.module}/webserver.sh")
  # tag_specifications {
  #   tags = {
  #     Name = "${var.global_var_name_tag_prefix}-${terraform.workspace}-asg-instance"
  #   }
  # }
  iam_instance_profile {
    name = var.var_ec2_instance_profile_name
  }

  tags = {
    Name = "${var.global_var_name_tag_prefix}-${terraform.workspace}-launch-template"
  }
}

resource "aws_autoscaling_group" "this" {
  name                      = "${var.global_var_name_tag_prefix}-${terraform.workspace}-app-auto-scalling-group"
  vpc_zone_identifier       = var.var_asg_vpc_zone_subnets_identifier
  desired_capacity          = var.var_ec2_instance_desired_capacity
  max_size                  = var.var_ec2_instance_desired_max
  min_size                  = var.var_ec2_instance_desired_min
  health_check_type         = var.var_asg_health_check_type
  health_check_grace_period = var.var_asg_health_check_grace_period


  traffic_source {
    identifier = var.var_asg_traffic_source_identifier
    type       = var.var_asg_traffic_source_type
  }

  launch_template {
    id      = aws_launch_template.this.id
    version = var.var_ec2_launch_template_version
  }
}

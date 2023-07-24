resource "aws_launch_template" "this" {
  name_prefix   = "${var.global_var_name_tag_prefix}-${terraform.workspace}-${var.var_ec2_instance_purpose}"
  image_id      = data.aws_ami.ubuntu_20_04.id
  instance_type = var.var_ec2_instance_type
  security_group_names = [var.var_asg_security_group_name]
}

resource "aws_autoscaling_group" "this" {
  name = "${var.global_var_name_tag_prefix}-${terraform.workspace}-app-auto-scalling-group"
  availability_zones = ["us-east-1a", "eu-west-1b", "eu-west-1c"]
  desired_capacity   = var.var_ec2_instance_desired_capacity
  max_size           = var.var_ec2_instance_desired_min
  min_size           = var.var_ec2_instance_desired_max
  health_check_type = var.var_asg_health_check_type
  health_check_grace_period = var.var_asg_health_check_grace_period


  traffic_source {
    identifier = var.var_asg_traffic_source_identifier
    type = var.var_asg_traffic_source_type
  }

  launch_template {
    id      = aws_launch_template.this.id
    version = var.var_ec2_launch_template_version
  }


}

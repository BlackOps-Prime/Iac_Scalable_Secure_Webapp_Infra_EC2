variable "global_var_name_tag_prefix" {
  type        = string
  description = "main project identifier"
}

variable "var_ec2_instance_purpose" {
  type        = string
  description = "intance purpose"
}

data "aws_ami" "ubuntu_20_04" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

variable "var_ec2_instance_type" {
  type        = string
  description = "EC2 Instance Type"
}

variable "var_ec2_instance_desired_capacity" {
  default     = 3
  description = "EC2 Instance desired capacity"
}

variable "var_ec2_instance_desired_min" {
  default     = 1
  description = "EC2 Instance desired min"
}

variable "var_ec2_instance_desired_max" {
  default     = 5
  description = "EC2 Instance desired max"
}

variable "var_ec2_launch_template_version" {
  type        = string
  default     = "$Latest"
  description = "EC2 Instance launch template version"
}

variable "var_asg_health_check_type" {
  type        = string
  default     = "ELB"
  description = "ASG Health Check Type"
}

variable "var_asg_health_check_grace_period" {
  default     = 10
  description = "ASG Health Check Grace Period"
}

variable "var_asg_traffic_source_identifier" {
  description = "ASG Traffic Source Identifier"
}

variable "var_asg_traffic_source_type" {
  default     = "elbv2"
  description = "ASG Traffic Source Identifier"
}

variable "var_asg_security_group_id" {
  description = "ASG Security Group"
}

variable "var_asg_vpc_zone_subnets_identifier" {
  description = "ASG VPC subnets list"
}

variable "var_ec2_instance_key_pair_name" {
  description = "ASG instance key pair"
}

variable "var_ec2_instance_profile_name" {
  description = "ASG IAM Profile"
}
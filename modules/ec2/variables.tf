variable "global_var_name_tag_prefix" {
  type        = string
  description = "main project identifier"
}

variable "var_ec2_instance_type" {
  type        = string
  description = "EC2 Instance Type"
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

variable "var_ec2_associate_public_ip" {
  description = "Auto assign public IP switch"
}

variable "var_ec2_availability_zones" {
  description = "Availability zones"
}

variable "var_ec2_instance_ebs_optimized" {
  description = "Switch for optimized attached EBS"
}

variable "var_ec2_iam_instance_profile" {
  description = "IAM profile for instances"
}

variable "var_ec2_instance_key_pair_name" {
  description = "EC2 instance SSH Key pair name"
}

variable "var_ec2_instance_monitoring_enabled" {
  description = "EC2 instance monitoring switch"
}

variable "var_ec2_instance_security_groups" {
  description = "EC2 instance security groups"
}

variable "var_ec2_instance_subnet_id" {
  description = "EC2 instance subnet ID"
}

variable "var_ec2_ebs_volume_delete_on_termintion" {
  default     = false
  description = "EC2 block storage delete on termination switch"
}

variable "var_ec2_ebs_volume_encryption" {
  default     = true
  description = "EC2 block storage encryption"
}

variable "var_ec2_ebs_volume_size" {
  description = "EC2 block storage size"
}

variable "var_ec2_ebs_volume_type" {
  description = "EC2 block storage type"
}

variable "var_ec2_instance_purpose" {
  description = "EC2 instance purpose"
}
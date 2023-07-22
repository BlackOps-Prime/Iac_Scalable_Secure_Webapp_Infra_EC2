output "main_app_readwrite_role" {
  value = aws_iam_role.main_app_readwrite_role.id
}

output "ec2_instance_profile" {
  value = aws_iam_instance_profile.this.name
}
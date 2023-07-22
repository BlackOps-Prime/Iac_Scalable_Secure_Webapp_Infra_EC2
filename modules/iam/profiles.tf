# Create an IAM instance profile
resource "aws_iam_instance_profile" "this" {
  name = var.var_ec2_instance_profile_name
  role = aws_iam_role.main_app_readwrite_role.name

  tags = {
    Name = "${var.global_var_name_tag_prefix}-${var.var_ec2_instance_profile_name}"
  }

  depends_on = [  aws_iam_policy.main_ecr_policy, aws_iam_policy.main_s3_policy ]
}
resource "aws_iam_role" "main_app_readwrite_role" {

  name = "${var.global_var_name_tag_prefix}-app-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  depends_on = [ aws_iam_policy.main_ecr_policy, aws_iam_policy.main_s3_policy  ]

  tags = {
    Name = "${var.global_var_name_tag_prefix}-app-role"
  }
}


# Attach the IAM policy to the IAM role
resource "aws_iam_policy_attachment" "app_role_policy_attachment" {
  name = "${var.global_var_name_tag_prefix}-app-role-policy-attachement"

  for_each = toset([
    "arn:aws:iam::${local.account_id}:policy/${var.global_var_name_tag_prefix}-s3-readwrite-policy",
    "arn:aws:iam::${local.account_id}:policy/${var.global_var_name_tag_prefix}-ecr-readwrite-policy",
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/AmazonSSMPatchAssociation"

  ])

  policy_arn = each.value
  roles      = [aws_iam_role.main_app_readwrite_role.name]

  depends_on = [ aws_iam_policy.main_ecr_policy, aws_iam_policy.main_s3_policy ]
}
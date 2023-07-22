resource "aws_iam_policy" "main_s3_policy" {
  name        = "${var.global_var_name_tag_prefix}-s3-readwrite-policy"
  path        = var.global_var_iam_s3_policy_path
  description = "S3 ReadWrite Policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket",
          "s3:DeleteObject",
          "s3:ListMultipartUploadParts"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })

  tags = {
    Name = "${var.global_var_name_tag_prefix}-s3-readwrite-policy"
  }
}

#session manager settings

resource "aws_iam_policy" "main_ecr_policy" {
  name        = "${var.global_var_name_tag_prefix}-ecr-readwrite-policy"
  path        = var.global_var_iam_ecr_policy_path
  description = "ECR ReadWrite Policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ecr:GetDownloadUrlForLayer",
          "ecr:DescribeRepositories",
          "ecr:ListImages",
          "ecr:DescribeImages",
          "ecr:ListTagsForResource",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })

  tags = {
    Name = "${var.global_var_name_tag_prefix}-ecr-readwrite-policy"
  }
}
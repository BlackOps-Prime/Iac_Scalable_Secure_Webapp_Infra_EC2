variable "global_var_name_tag_prefix" {
  type        = string
  description = "main project identifier"
}

variable "global_var_iam_s3_policy_path" {
  type        = string
  default     = "/"
  description = "IAM S3 policy path"
}

variable "global_var_iam_ecr_policy_path" {
  type        = string
  default     = "/"
  description = "IAM ECR policy path"
}

variable "var_ec2_instance_profile_name" {
  type        = string
  description = "IAM instance profile name"
}

data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}
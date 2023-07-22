terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  #   Configure Terraform Backend
  backend "s3" {
    bucket  = "iac-webapp-terraform-states"
    key     = "terraform.tfstate"
    region  = "eu-west-1"
    profile = "kroode"
  }
}


# Configure the AWS Provider
provider "aws" {
  region = var.global_var_ird_region
  profile = var.global_var_aws_profile

  default_tags {
    tags = {
      Environment = terraform.workspace
      Terraform   = true
    }

  }
}
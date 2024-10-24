provider "aws" {
  region = var.aws_region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "ptuan-terraform-state-bucket"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}
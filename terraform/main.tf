
terraform {
  backend "s3" {
    bucket = "101-terraform-backend"
    key    = "ts-state-file"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.0.0"
    }
  }
}


provider "aws" {
  region  = var.aws-region
}
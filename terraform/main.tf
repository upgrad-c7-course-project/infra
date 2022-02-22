
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


# NOTE: Have not created DynamoDB lock due to permissions missing for the same on Nuverpro account
provider "aws" {
  region  = var.aws-region
  profile = "personal"
}


resource "aws_s3_bucket" "terraform-backend" {
  bucket = var.terraform-backend-bucket

  tags = {
    Name = var.terraform-backend-bucket
  }
}
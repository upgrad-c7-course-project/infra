# TODO: break up the file and use vars

terraform {
  # backend "s3" {
  #   bucket = "101-terraform-backend"
  #   key    = "ts-state-file"
  #   region = "us-east-1"
  # }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.0.0"
    }
  }
}


# NOTE: Have not created DynamoDB lock due to permissions missing for the same on Nuverpro account


provider "aws" {
  region = "us-east-1"
}


resource "aws_s3_bucket" "terraform-backend" {
  bucket = "101-terraform-backend"

  tags = {
    Name        = "101-terraform-backend"
  }
}
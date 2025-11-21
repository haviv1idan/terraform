terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


resource "aws_s3_bucket" "dev-bucket" {
  bucket = "my-tf-dev-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
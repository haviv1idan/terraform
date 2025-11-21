terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "aws_s3_bucket" "dev-bucket" {
  bucket = "my-tf-dev-bucket-${random_string.bucket_suffix.result}"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

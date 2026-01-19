terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.28.0"
    }
  }
}

provider "aws" {    
  
}

resource "aws_s3_bucket" "default" {
}

resource "aws_s3_object" "object" {
  bucket = resource.aws_s3_bucket.default
  key    = "aymansFile.txt"
  source = "aymansFile.txt"
}
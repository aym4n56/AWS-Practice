terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.28.0"
    }
  }
}

provider "aws" {    
  region = "eu-west-2"
}

resource "aws_s3_bucket" "default" {  
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.default.id
  key    = "aymansFile.txt"
  source = "aymansFile.txt"

  etag = filemd5("aymansFile.txt")
}
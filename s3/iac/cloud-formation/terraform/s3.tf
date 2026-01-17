resource "aws_s3_bucket" "aymans-bucket" {
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
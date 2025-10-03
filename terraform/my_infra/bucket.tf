resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.env}-bucket"

  tags = {
    Name        = "${var.env}-bucket"
    Environment = var.env
  }
}


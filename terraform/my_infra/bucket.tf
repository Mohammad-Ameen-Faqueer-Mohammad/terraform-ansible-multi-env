resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.env}-bucket3-${random_id.suffix.hex}"

  tags = {
    Name        = "$${var.env}-bucket3-${random_id.suffix.hex}"
    Environment = var.env
  }
 }

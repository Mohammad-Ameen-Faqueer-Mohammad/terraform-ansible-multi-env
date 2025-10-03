resource "aws_dynamodb_table" "my_table" {
  name         = "${var.env}-mytable"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "userId"

  attribute {
    name = "userId"
    type = "S"
  }

  tags = {
    Name        = "${var.env}-mytable"
    Environment = var.env
  }
}


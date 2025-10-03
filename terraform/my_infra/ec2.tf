resource "aws_default_vpc" "default" {}

resource "aws_security_group" "my_sg" {
  name        = "my_sg"
  description = "${var.env}My security group"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    description = "Allow 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}My security group"
    Environment = var.env
  }
}

resource "aws_key_pair" "my_key" {
  key_name   = "${var.env}my-key-terra"
  public_key = file("~/.ssh/my-key.pub")
}

resource "aws_instance" "amin_terraform_instance" {
  ami                    = "ami-02d26659fd82cf299" # Replace with a valid Ubuntu AMI ID
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = "Ameeen Instance from TERRAFORM"
  }
}

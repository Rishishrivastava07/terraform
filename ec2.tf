# key pair (login)

resource "aws_key_pair" "my_key_pair" {
  key_name   = "terra-key-ec2"
  public_key = file("./terra-key-ec2.pub")
}

# VPC & Security Group

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance

resource "aws_instance" "my_ec2_instance" {
  count           = 3 # Create 3 EC2 instances
  ami             = var.ec2_ami_id
  instance_type   = var.ec2_instance_type
  key_name        = aws_key_pair.my_key_pair.key_name
  security_groups = [aws_security_group.allow_ssh.name]
  user_data       = file("nginx.sh")

  tags = {
    Name = "MyEC2Instance"
  }

  root_block_device {
    volume_size = var.env == "production" ? 10 : var.default_root_storage_size # 10 GB for production, default for others
    volume_type = "gp3"
  }
}


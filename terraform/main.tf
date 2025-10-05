resource "aws_security_group" "instance_sg" {
  name   = "${var.module_prefix}-sg"
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.allowed_http_cidr]
    description = "Allow HTTP from my IP"
  }
  tags = {
    Name = "${var.module_prefix}-sg"
  }
}

resource "aws_key_pair" "jro-key-pair" {
  key_name   = "${var.module_prefix}-key-pair"
  public_key = file("~/.ssh/jro-key.pub")

  tags = {
    Name = "${var.module_prefix}-key-pair"
  }
}

// "this" -> common convention to refer to the module's primary resource
resource "aws_instance" "this" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.instance_sg.id]
  associate_public_ip_address = true
  user_data                   = var.user_data
  iam_instance_profile        = var.iam_instance_profile
  key_name                    = aws_key_pair.jro-key-pair.key_name
  tags = {
    Name = "${var.module_prefix}-instance"
  }
}

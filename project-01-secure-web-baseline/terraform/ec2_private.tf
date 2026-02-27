# Security group for the private EC2
resource "aws_security_group" "private_ec2" {
  name        = "${var.project_name}-private-ec2-sg"
  description = "Private EC2 SG"
  vpc_id      = aws_vpc.this.id

  egress {
    description = "All egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.tags, {
    Name = "${var.project_name}-private-ec2-sg"
  })
}

# Allow HTTP from ALB to Private EC2
resource "aws_security_group_rule" "allow_alb_http" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.private_ec2.id
  source_security_group_id = aws_security_group.alb.id
}

  egress {
    description = "All egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.tags, { Name = "${var.project_name}-private-ec2-sg" })
}

resource "aws_instance" "private" {
  ami                    = data.aws_ami.al2023.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_a.id
  vpc_security_group_ids = [aws_security_group.private_ec2.id]

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  associate_public_ip_address = false

  # 🚀 Automatic nginx setup
  user_data = <<-EOF
              #!/bin/bash
              set -e

              dnf -y update
              dnf -y install nginx

              systemctl enable nginx
              systemctl start nginx

              echo "Secure Web Baseline - Private EC2 via SSM (user_data automated)" > /usr/share/nginx/html/index.html
              EOF

  tags = merge(local.tags, {
    Name = "${var.project_name}-private-ec2"
  })
}
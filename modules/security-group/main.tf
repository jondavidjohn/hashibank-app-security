# This is a simple, reusable module that knows how to create one thing:
# an AWS security group.

variable "vpc_id" {
  description = "The VPC ID where the security group will be created."
  type        = string
}

variable "description" {
  description = "Description of the security group."
  type        = string
}

resource "aws_security_group" "app" {
  name        = "hashibank-app-sg"
  description = var.description
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow all inbound traffic for demo purposes"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
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
    Name = "hashibank-app-security-group"
  }
}
output "security_group_id" {
  description = "The ID of the security group created."
  value       = aws_security_group.app.id
}

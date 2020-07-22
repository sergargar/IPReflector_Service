resource "aws_security_group" "instance" { 
  name = "allow_http_ssh"
  description = "Security group for my ssh and http" 
  ingress { 
    from_port = 22 
    to_port = 22 
    protocol = "tcp" 
    cidr_blocks = ["72.21.198.65/32"] 
  }

  ingress{
    from_port = 80 
    to_port = 80 
    protocol = "tcp" 
    cidr_blocks = ["72.21.198.65/32"] 
    }

  egress { 
    from_port = 0 
    to_port = 0 
    protocol = "-1" 
    cidr_blocks = ["72.21.198.65/32"] 
  }
}
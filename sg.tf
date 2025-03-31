resource "aws_security_group" "web-server_sg" {
  name        = "web-server-sg"
  description = "Allow  web traffic and SSH"
  vpc_id      = aws_vpc.vpc1.id

  # Inbound Rules
  ingress {
    description = "SSH from specfic IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["107.136.167.181/32"] 
  }

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP from anywhere
  }

 ingress {
    description = "HTTP from anywhere"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP from anywhere
 }
  # Outbound Rules (Allow all traffic)

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-server-security-group"
  }
  
  depends_on = [aws_vpc.vpc1]
}



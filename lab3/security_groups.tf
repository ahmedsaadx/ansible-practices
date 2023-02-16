resource "aws_security_group" "sg-01" {
  description = "allow http and ssh traffic to network"
  vpc_id      = aws_vpc.vpc-1.id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "http"
    from_port   = "80"
    protocol    = "tcp"
    to_port     = "80"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "ssh"
    from_port   = "22"
    protocol    = "tcp"
    to_port     = "22"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "sg-01"
  }

}

resource "aws_security_group" "sg-02" {
  description = "allow nexus and sonar qube , ssh traffic to network"
  vpc_id      = aws_vpc.vpc-1.id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "nexus port"
    from_port   = "8081"
    protocol    = "tcp"
    to_port     = "8081"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "nexus port"
    from_port   = "9000"
    protocol    = "tcp"
    to_port     = "9000"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "ssh"
    from_port   = "22"
    protocol    = "tcp"
    to_port     = "22"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "sg-01"
  }

}
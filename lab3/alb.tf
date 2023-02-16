resource "aws_security_group" "alb_sg" {
  name_prefix = "alb-sg"
  vpc_id      = aws_vpc.vpc-1.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "alb-1" {
  name               = "public-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public-subnet.id , aws_subnet.public-subnet-1.id]

  security_groups = [
    aws_security_group.alb_sg.id
  ]

  tags = {
    Name = "public alb"
  }
}

resource "aws_lb_listener" "http-1" {
  load_balancer_arn = aws_lb.alb-1.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http-1.arn
  }
}
resource "aws_lb_target_group" "http-1" {
  name_prefix      = "http"
  port             = 80
  protocol         = "HTTP"
  vpc_id           = aws_vpc.vpc-1.id

  health_check {
    path = "/"
  }

  target_type = "instance"

  tags = {
    Name = "http-tg"
  }
}
resource "aws_lb_target_group_attachment" "nginx1" {
  target_group_arn = aws_lb_target_group.http-1.arn
  target_id        = aws_instance.public_ec2.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "nginx2" {
  target_group_arn = aws_lb_target_group.http-1.arn
  target_id        = aws_instance.public_ec2-1.id
  port             = 80
}




resource "aws_lb" "alb" {
  name               = "alb"
  internal           = true
  load_balancer_type = "application"
  subnets            = [aws_subnet.private-subnet.id , aws_subnet.private-subnet-1.id]

  security_groups = [
    aws_security_group.alb_sg.id
  ]

  tags = {
    Name = "private alb"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http.arn
  }
}

resource "aws_lb_target_group" "http" {
  name_prefix      = "http"
  port             = 80
  protocol         = "HTTP"
  vpc_id           = aws_vpc.vpc-1.id

  health_check {
    path = "/"
  }

  target_type = "instance"

  tags = {
    Name = "http-tg"
  }
}

resource "aws_lb_target_group_attachment" "nexus" {
  target_group_arn = aws_lb_target_group.http.arn
  target_id        = aws_instance.private_ec2.id
  port             = 8081
}

resource "aws_lb_target_group_attachment" "sonar" {
  target_group_arn = aws_lb_target_group.http.arn
  target_id        = aws_instance.private_ec2_1.id
  port             = 9000
}
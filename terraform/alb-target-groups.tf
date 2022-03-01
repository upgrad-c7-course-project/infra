# ALB 

resource "aws_s3_bucket" "alb-logs-bucket" {
  bucket = "101-alb-logs"

  tags = {
    Name = "101-alb-logs"
  }
}

resource "aws_lb" "alb" {
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.public_web_sg.id]
  subnets            = [aws_subnet.public-subnet1.id, aws_subnet.public-subnet2.id]

  access_logs {
    bucket  = aws_s3_bucket.alb-logs-bucket.bucket
    enabled = false
  }

  tags = {
    Name = "101-alb"
  }

}


resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.alb.id
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      status_code  = "404"
      content_type = "text/plain"
      message_body = "Not Found"
    }
  }
}



resource "aws_lb_listener_rule" "alb-listener-jenkins" {
  listener_arn = aws_lb_listener.alb-listener.id

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jenkins-targets.id
  }

  condition {
    path_pattern {
      values = ["/jenkins", "/jenkins/*"]
    }
  }
}


resource "aws_lb_listener_rule" "alb-listener-app" {
  listener_arn = aws_lb_listener.alb-listener.id

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app-targets.id
  }

  condition {
    path_pattern {
      values = ["/app", "/app/*"]
    }
  }
}


# App targets
resource "aws_lb_target_group" "app-targets" {
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "instance"

  tags = {
    Name = "101-app-targets"
  }
}

resource "aws_lb_target_group_attachment" "app-targets-attach" {
  target_group_arn = aws_lb_target_group.app-targets.arn
  target_id        = aws_instance.app.id
  port             = 8080
}



# Jenkins targets
resource "aws_lb_target_group" "jenkins-targets" {
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "instance"

  tags = {
    Name = "101-jenkins-targets"
  }
}

resource "aws_lb_target_group_attachment" "jenkins-targets-attach" {
  target_group_arn = aws_lb_target_group.jenkins-targets.arn
  target_id        = aws_instance.jenkins.id
  port             = 8080
}

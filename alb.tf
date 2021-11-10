resource "aws_lb" "alb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.http.id]
  subnets            = [aws_subnet.public_1a.id, aws_subnet.public_1b.id]

  enable_deletion_protection = false
}

resource "aws_lb_listener" "webserver" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webserver.arn
  }
}

resource "aws_lb_listener_rule" "phpmyadmin" {
  listener_arn = aws_lb_listener.webserver.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webserver.arn
  }
  condition {
    path_pattern {
      values = ["/phpMyAdmin/*"]
    }
  }
}


resource "aws_lb_target_group" "webserver" {
  name        = "nginx"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.myvpc.id
}

resource "aws_lb_target_group_attachment" "nginx1" {
  target_group_arn = aws_lb_target_group.webserver.arn
  target_id        = aws_instance.webserver.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "nginx2" {
  target_group_arn = aws_lb_target_group.webserver.arn
  target_id        = aws_instance.webserver2.id
  port             = 80
}



resource "aws_lb_target_group" "myadmin" {
  name        = "myadmin"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.myvpc.id
}

resource "aws_lb_target_group_attachment" "myadmin" {
  target_group_arn = aws_lb_target_group.myadmin.arn
  target_id        = aws_instance.phpmyadmin.id
  port             = 80
}

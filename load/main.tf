# BLUE

#making the vpc blue vms and using the key i have saved in my laptop
resource "aws_launch_configuration" "Launch-C" {
  image_id = "ami-06e46074ae430fba6"
  instance_type = "t2.micro"
  key_name = "keys144"
  security_groups = [var.sg_blueVar]
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              cd /var/www/html
			  echo "<html><body><h1> Hello from Xerxes Lira at VPC BLUE at $(hostname -f) </html></body></h1>" | sudo tee -a  index.html
              systemctl enable httpd
              EOF
}

#Making the load balancer for the vms named Blueloadbalancer
resource "aws_lb" "LB1" {
  name = "Blueloadbalancer"
  load_balancer_type = "application"
  subnets = [var.var_cidrBlue-1, var.var_cidrBlue-2, var.var_cidrBlue-3]
  security_groups = [var.sg_blueVar]
}


#auto scaling and putting the minimum and max vms and adding the cidrs
#with the zone identifiers
resource "aws_autoscaling_group" "ASG-2" {
  launch_configuration = aws_launch_configuration.Launch-C.name
  vpc_zone_identifier = [var.var_cidrBlue-1, var.var_cidrBlue-2, var.var_cidrBlue-3]
  target_group_arns = [aws_lb_target_group.asg-tg-blue.arn]
  health_check_type = "ELB"
  min_size = 3
  max_size = 3
}


#is the listener for the load balancer that listens for incoming traffic
#on port 80
#defaut action blocks traffic  and give the not found page
resource "aws_lb_listener" "http-blue" {
  load_balancer_arn = aws_lb.LB1.arn
  port = 80
  protocol = "HTTP"
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found"
      status_code = 404
    }
  }
}


#creates a target group for instances with the var.vpc_blueVar
resource "aws_lb_target_group" "asg-tg-blue" {
  name = "asg-tg-blue"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_blueVar
  health_check {
    path = "/"
    protocol = "HTTP"
    matcher = "200"
    interval = 15
    timeout = 3
    healthy_threshold = 2
    unhealthy_threshold = 2
  }
}


#is the listener rule that forwards incoming
#requests to a specific target group
#pirority is 100
resource "aws_lb_listener_rule" "asg-listen-blue" {
  listener_arn = aws_lb_listener.http-blue.arn
  priority = 100
  condition {
    path_pattern {
      values = ["*"]
    }
  }
  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.asg-tg-blue.arn
  }
}


# GREEN

#making the vpc blue vms and using the key i have saved in my laptop
#Note: i have to add http manually sorry for that
resource "aws_launch_configuration" "Launch-D" {
	image_id = "ami-06e46074ae430fba6"
	instance_type = "t2.micro"
	security_groups = [var.sg_greenVar]
	key_name = "keys144"
	user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd
              sudo systemctl enable httpd
              cd /var/www/html
			  echo "<html><body><h1> Hello from Xerxes Lira at VPC GREEN at $(hostname -f) </html></body></h1>" | sudo tee -a  index.html
              sudo systemctl restart httpd
              EOF
}



#Making the load balancer for the vms named Greenloadbalancer
resource "aws_lb" "LB2" {
	name = "Greenloadbalancer"
	load_balancer_type = "application"
	subnets = [var.var_cidrGreen-1, var.var_cidrGreen-2, var.var_cidrGreen-3]
	security_groups = [var.sg_greenVar]
	#vpc_id = var.vpc_greenVar
}

#auto scaling and putting the minimum and max vms and adding the cidrs
#with the zone identifiers
resource "aws_autoscaling_group" "ASG-3" {
	launch_configuration = aws_launch_configuration.Launch-D.name
	vpc_zone_identifier = [var.var_cidrGreen-1, var.var_cidrGreen-2, var.var_cidrGreen-3]
	target_group_arns = [aws_lb_target_group.asg-tg-green.arn]
	health_check_type = "ELB"
	min_size = 3
	max_size = 3
}

#is the listener for the load balancer that listens for incoming traffic
#on port 80
#defaut action blocks traffic  and give the not found page
resource "aws_lb_listener" "http-green" {
	load_balancer_arn = aws_lb.LB2.arn
	port = 80
	protocol = "HTTP"
	default_action {
		type = "fixed-response"
		fixed_response {
			content_type = "text/plain"
			message_body = "404: page not found"
			status_code = 404
		}
	}
}

#creates a target group for instances with the var.vpc_greenVar
resource "aws_lb_target_group" "asg-tg-green" {
  name     = "asg-tg-green"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_greenVar

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

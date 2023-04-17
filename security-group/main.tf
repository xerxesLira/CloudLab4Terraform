#Blue varibles


#Making the security groups for the blue vpc. We are allowing
#HTTP and SSH for imcoming traffic from any ip address
#and for outcoming traffic we allow with any ip address
resource "aws_security_group" "Lab4_SecGR_Blue" {
  name        = "Lab4_SecGR_Blue"
  description = "allows SSH and HTTP"
  vpc_id      = var.vpc_blue_varSG
  ingress {
    description = "allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "allow all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


#Making the security groups for the green vpc. We are allowing
#HTTP and SSH for imcoming traffic from any ip address
#and for outcoming traffic we allow with any ip address
resource "aws_security_group" "Lab4_SecGR_Green" {
  name        = "Lab4_SecGR_Green"
  description = "allows SSH and HTTP"
  vpc_id      = var.vpc_green_varSG
  ingress {
    description = "allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "allow all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
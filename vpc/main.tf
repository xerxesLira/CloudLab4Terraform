locals {
  Internet-CIDR = "0.0.0.0/0"
}


#making the blue vpc
resource "aws_vpc" "L4blueVpc" {
  cidr_block           = var.var_cidrBlue
  enable_dns_support   = true
  enable_dns_hostnames = true
}


#making the igw for the blue vpc to get internet
resource "aws_internet_gateway" "L4_igwBlue" {
  vpc_id = aws_vpc.L4blueVpc.id
}

#making the routing table for the blue vpc
resource "aws_route_table" "L4_blue_RT" {
  vpc_id = aws_vpc.L4blueVpc.id
}

#making the internet route
resource "aws_route" "Internet-Route" {
  route_table_id         = aws_route_table.L4_blue_RT.id
  destination_cidr_block = local.Internet-CIDR
  gateway_id             = aws_internet_gateway.L4_igwBlue.id
}


#making 3 subnets with 3 different areas associated with the 
#blue vpc and are lauching an public ip address 
resource "aws_subnet" "BLUE-SN-1" {
  vpc_id                                      = aws_vpc.L4blueVpc.id
  availability_zone                           = var.var_area[0]
  cidr_block                                  = var.var_cidrBlue-1
  enable_resource_name_dns_a_record_on_launch = true
  map_public_ip_on_launch                     = true
}

resource "aws_subnet" "BLUE-SN-2" {
  vpc_id                                      = aws_vpc.L4blueVpc.id
  availability_zone                           = var.var_area[1]
  cidr_block                                  = var.var_cidrBlue-2
  enable_resource_name_dns_a_record_on_launch = true
  map_public_ip_on_launch                     = true
}

resource "aws_subnet" "BLUE-SN-3" {
  vpc_id                                      = aws_vpc.L4blueVpc.id
  availability_zone                           = var.var_area[2]
  cidr_block                                  = var.var_cidrBlue-3
  enable_resource_name_dns_a_record_on_launch = true
  map_public_ip_on_launch                     = true
}


#making 3 routing table associations for the blue routing table
#and the blue subnets
resource "aws_route_table_association" "BLUE-SN1-RT-A" {
  subnet_id      = aws_subnet.BLUE-SN-1.id
  route_table_id = aws_route_table.L4_blue_RT.id
}

resource "aws_route_table_association" "BLUE-SN2-RT-A" {
  subnet_id      = aws_subnet.BLUE-SN-2.id
  route_table_id = aws_route_table.L4_blue_RT.id
}

resource "aws_route_table_association" "BLUE-SN3-RT-A" {
  subnet_id      = aws_subnet.BLUE-SN-3.id
  route_table_id = aws_route_table.L4_blue_RT.id
}






#Green VPC 


#making the green vpc
resource "aws_vpc" "L4greenVpc" {
  cidr_block           = var.var_cidrGreen
  enable_dns_support   = true
  enable_dns_hostnames = true
}


#making the igw for the green vpc to get internet
resource "aws_internet_gateway" "L4_igwGreen" {
  vpc_id = aws_vpc.L4greenVpc.id
}


#making the routing table for the green vpc
resource "aws_route_table" "L4_green_RT" {
  vpc_id = aws_vpc.L4greenVpc.id
}

#making internet route for green
resource "aws_route" "Internet-RouteGreen" {
  route_table_id         = aws_route_table.L4_green_RT.id
  destination_cidr_block = local.Internet-CIDR
  gateway_id             = aws_internet_gateway.L4_igwGreen.id
}


#making 3 subnets with 3 different areas associated with the 
#green vpc and are lauching an public ip address 
resource "aws_subnet" "GREEN-SN-1" {
  vpc_id                                      = aws_vpc.L4greenVpc.id
  availability_zone                           = var.var_area[0]
  cidr_block                                  = var.var_cidrGreen-1
  enable_resource_name_dns_a_record_on_launch = true
  map_public_ip_on_launch                     = true
}

resource "aws_subnet" "GREEN-SN-2" {
  vpc_id                                      = aws_vpc.L4greenVpc.id
  availability_zone                           = var.var_area[1]
  cidr_block                                  = var.var_cidrGreen-2
  enable_resource_name_dns_a_record_on_launch = true
  map_public_ip_on_launch                     = true
}

resource "aws_subnet" "GREEN-SN-3" {
  vpc_id                                      = aws_vpc.L4greenVpc.id
  availability_zone                           = var.var_area[2]
  cidr_block                                  = var.var_cidrGreen-3
  enable_resource_name_dns_a_record_on_launch = true
  map_public_ip_on_launch                     = true
}


#making 3 routing table associations for the green routing table
#and the blue subnets
resource "aws_route_table_association" "GREEN-SN1-RT-A" {
  subnet_id      = aws_subnet.GREEN-SN-1.id
  route_table_id = aws_route_table.L4_green_RT.id
}

resource "aws_route_table_association" "GREEN-SN2-RT-A" {
  subnet_id      = aws_subnet.GREEN-SN-2.id
  route_table_id = aws_route_table.L4_green_RT.id
}

resource "aws_route_table_association" "GREEN-SN3-RT-A" {
  subnet_id      = aws_subnet.GREEN-SN-3.id
  route_table_id = aws_route_table.L4_green_RT.id
}

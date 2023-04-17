#Blue varibles

#represents the id of the security group for the blue vpc
variable "sg_blueVar" {
	type = string 
}

#the string that has the vpc id for blue
variable "vpc_blueVar" {
	type = string
}

#cidr block
variable "var_cidrBlue-1" {
	type = string
	default = "100.64.1.0/24"
}

#cidr block
variable "var_cidrBlue-2" {
	type = string
	default = "100.64.2.0/24"
}

#cidr block
variable "var_cidrBlue-3" {
	type = string
	default = "100.64.3.0/24"
}



#Green

#represents the id of the security group for the green vpc
variable "sg_greenVar" {
	type = string 
}

#the string that has the vpc id for green
variable "vpc_greenVar" {
	type = string
}

#cidr block
variable "var_cidrGreen-1" {
	type = string
	default = "192.168.1.0/20"
}

#cidr block
variable "var_cidrGreen-2" {
	type = string
	default = "192.168.2.0/20"
}

#cidr block
variable "var_cidrGreen-3" {
	type = string
	default = "192.168.3.0/20"
}
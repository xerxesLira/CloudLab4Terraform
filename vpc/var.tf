#BLUE

#cidr block for the VPC blue and range
variable "var_cidrBlue" {
	type = string
	default = "100.64.0.0/16"
}


#subnets we are using for vpc blue
variable "var_cidrBlue-1" {
	type = string
	default = "100.64.1.0/24"
}

variable "var_cidrBlue-2" {
	type = string
	default = "100.64.2.0/24"
}

variable "var_cidrBlue-3" {
	type = string
	default = "100.64.3.0/24"
}


#GREEN

#cidr block for the VPC green and range
variable "var_cidrGreen" {
	type = string
	default = "192.168.0.0/16"
}

#subnets we are using for vpc green
variable "var_cidrGreen-1" {
	type = string
	default = "192.168.1.0/24"
}

variable "var_cidrGreen-2" {
	type = string
	default = "192.168.2.0/24"
}

variable "var_cidrGreen-3" {
	type = string
	default = "192.168.0.0/24"
}


#availability zones for the vms
#for both green and blue
variable "var_area" {
	type    = list(string)
	default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
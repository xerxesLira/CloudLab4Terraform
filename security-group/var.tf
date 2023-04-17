#Blue

#used to pass a value from one module to another in this case security-group 
#module
variable "vpc_blue_varSG" {
	type = string
}

#Green

#used to pass a value from one module to another in this case security-group 
#module
variable "vpc_green_varSG" {
	type = string
}
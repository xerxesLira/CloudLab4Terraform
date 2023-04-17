#Blue

#HAs the id of the blue vpc 
output "output_blueVPC" {
	value = aws_vpc.L4blueVpc.id
}

#gets the subnets from BLUE-SN-x 
# so it can be used in other modules
output "output_blueVPC-1" {
	value = aws_subnet.BLUE-SN-1.id
}

output "output_blueVPC-2" {
	value = aws_subnet.BLUE-SN-2.id
}

output "output_blueVPC-3" {
	value = aws_subnet.BLUE-SN-3.id
}


#Green

#HAs the id of the green vpc
output "output_greenVPC" {
	value = aws_vpc.L4greenVpc.id
}

#gets the subnets from BLUE-SN-x 
# so it can be used in other modules
output "output_greenVPC-1" {
	value = aws_subnet.GREEN-SN-1.id
}

output "output_greenVPC-2" {
	value = aws_subnet.GREEN-SN-2.id
}

output "output_greenVPC-3" {
	value = aws_subnet.GREEN-SN-3.id
}


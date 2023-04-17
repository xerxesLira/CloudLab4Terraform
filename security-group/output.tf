#Blue

#output varible for the Lab4_SecGR_Blue security group
output "blue_sg_output" {
  value = aws_security_group.Lab4_SecGR_Blue.id
}


#Green

#output varible for the Lab4_SecGR_Green security group
output "green_sg_output" {
  value = aws_security_group.Lab4_SecGR_Green.id
}

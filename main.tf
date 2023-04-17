locals {
  key-name = "keys144"
}



#are using the vpc module 
#we are making the subnets for the vpc
#and using the availability zones
module "vpc" {
  source = "./vpc"
  var_cidrBlue  = "100.64.0.0/16"
  var_cidrGreen  = "192.168.0.0/16"
  var_cidrBlue-1  = "100.64.1.0/24"
  var_cidrGreen-1  = "192.168.1.0/24"
  var_cidrBlue-2 = "100.64.2.0/24"
  var_cidrGreen-2  = "192.168.2.0/24"
  var_cidrBlue-3 = "100.64.3.0/24"
  var_cidrGreen-3  = "192.168.3.0/24"
  var_area = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

#accessing the security-group module
module "security-group" {
  source = "./security-group"
  vpc_blue_varSG = module.vpc.output_blueVPC
  vpc_green_varSG = module.vpc.output_greenVPC
}

#accessing the load module 
#and making the load balancer and putting the load
#balancer via the colors
module "load" {
  source = "./load"
  vpc_blueVar = module.vpc.output_blueVPC
  sg_blueVar = module.security-group.blue_sg_output
  var_cidrBlue-1 = module.vpc.output_blueVPC-1
  var_cidrBlue-2 = module.vpc.output_blueVPC-2
  var_cidrBlue-3 = module.vpc.output_blueVPC-3
  vpc_greenVar = module.vpc.output_greenVPC
  sg_greenVar = module.security-group.green_sg_output
  var_cidrGreen-1 = module.vpc.output_greenVPC-1
  var_cidrGreen-2 = module.vpc.output_greenVPC-2
  var_cidrGreen-3 = module.vpc.output_greenVPC-3
  
    
}

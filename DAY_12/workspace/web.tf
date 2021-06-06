provider "aws" {
  
  region  = "us-east-1"
  profile = "default"
  
}

variable "type" {
  
  type = map
  default = {
    
    dev  = "t2.micro"
    test = "t2.small"
    prod = "t2.large"
    
  }
  
}

resource "aws_instance" "web_os" {
  
  ami = "ami-0d5eff06f840b45e9"
  instance_type = lookup(var.type , terraform.workspace)
  
  tags = {
    Name = "MY NEW WEBSERVER"
  }
  
  output "o1" {
    
    value = terraform.workspace
    
  }

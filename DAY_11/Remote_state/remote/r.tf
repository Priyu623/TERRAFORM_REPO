provider "aws" {
  
  region  = "us-east-1"
  profile = "terraform"
  
}

terraform {
  
  backend "s3" {
    
    bucket = "my"
    key    = "my_tfstate"
    region = "us-east-1"

  }
  
}

resource "aws_instance" "web" {
  
  ami           = "ami-0d5eff06f840b45e9"
  instance_type = "t3.micro"
  
  tags = {
    Name = "HelloWorld"
    
  }
  
}

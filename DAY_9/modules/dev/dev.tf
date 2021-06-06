provider "aws" {
  
  region  = "us-east-1"
  profile = "terraform"
  
}

module "my_dev_mod" {
  
    source = "../ec2"
    mtype  = "t2.micro"
  
}

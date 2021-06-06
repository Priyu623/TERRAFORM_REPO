provider "aws" {
  
  region  = "us-east-1"
  profile = "terraform"
  
}

module "my_prod_mod" {
  
    source = "../ec2"
    mtype  = "t2.large"
  
}

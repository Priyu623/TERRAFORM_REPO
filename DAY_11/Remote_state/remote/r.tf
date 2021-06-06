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



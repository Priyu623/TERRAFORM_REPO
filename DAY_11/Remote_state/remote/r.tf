provider "aws" {
  
  region  = "us-east-1"
  profile = "terraform"
  
}

terraform {
  
  backend "s3" {
    
    bucket = "my-tf-lw-bucket-4"
    key    = "my_tfstate"
    region = "us-east-1"
    
dynamodb_table = "tfstate-lock-table"

  }
  
}


# SOME COMMANDS ARE :

# terraform state

# terraform state pull

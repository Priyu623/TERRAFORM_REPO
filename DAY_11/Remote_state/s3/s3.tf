provider "aws" {
  
   region  = "us-east-1"
   profile = "terraform"
  
}

resource "aws_s3_bucket" "my_buc" {
   
  bucket = "my-tf-lw-bucket-4"
  
lifecycle {
  prevent_destroy = true
}
  
versioning { 
  enabled = true
}
  
  tags = { 
    Name        = "My_Bucket"
    Environment = "Dev"
  }
  
}

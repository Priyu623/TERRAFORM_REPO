provider "aws" {
  
   region  = "us-east-1"
   profile = "terraform"
  
}

resource "aws_instance" "my_os" {
  
   ami           = "ami-0d5eff06f840b45e9"
   instance_type = var.mtype
  
  tags = {
     Name = "my first TF OS 11"
 }
  
}

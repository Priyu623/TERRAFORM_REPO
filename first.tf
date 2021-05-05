provider "aws" {

region = "us-east-1"
access_key = "AKIAXHYRHLP7SISPEIXH"
secret_key = "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"

}

resource "aws_instance" "terraform_os"  {

ami = "ami-0d5eff06f840b45e9"
instance_type = "t2.micro"
tags = {
	Name = "MY FIRST OS USING TERRAFORM"
     }
}

resource "aws_instance" "web" {
  
  ami           = "ami-0d5eff06f840b45e9"
  instance_type = "t3.micro"
  
  tags = {
    Name = "HelloWorld"
    
  }
  
}

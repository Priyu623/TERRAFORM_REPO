resource "aws_instance" "web_os" {
  
 ami = "ami-0d5eff06f840b45e9"
 instance_type = "t2.micro"
 key_name = "terrraform_key"
 security_groups = ["terraform-sg"]
  
 tags = {
  Name = "Web Server by TF"
 }
}

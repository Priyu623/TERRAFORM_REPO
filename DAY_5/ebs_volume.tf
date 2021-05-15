resource "aws_ebs_volume" "storage" {
  
  availability_zone = aws_instance.web_os.availability_zone 
  size = 5
  
  tags = {
    Name = "MY NEW TF"
  }
}

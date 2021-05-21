provider "aws" {

  region     = "us-east-1"
  access_key = "XYZ"
  secret_key = "ABC"

}

resource "aws_instance"  "EC2_OS" {

  ami           = "ami-0d5eff06f840b45e9"
  instance_type = "t2.micro"
  tags = {
    
    Name = "EBS_VOLUME"
    
  }

}  

resource "aws_ebs_volume"  "ebs_vol" {
  
  availability_zone = aws_instance.EC2_OS.availability_zone
  size              = 10
  tags = {
    
    Name = "MY_VOl"
    
  }

}


resource "aws_volume_attachment"  "vol_attach" {
  
  device_name = "/dev/sdn"
  volume_id   = aws_ebs_volume.ebs_vol.id
  instance_id = aws_instance.EC2_OS.id

}

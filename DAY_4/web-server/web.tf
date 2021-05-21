provider "aws" {
  
  region     = "us-east-1"
  access_key = "XYZ"
  secret_key = "ABC"
}

resource "aws_instance" "prov_os" {
  ami             = "ami-0d5eff06f840b45e9"
  instance_type   = "t2.micro"
  security_groups = [ "terraform-sg" ]
  key_name        = "terrraform_key"

  tags = {
    Name = "NEW_OS"
  }
}

resource "aws_ebs_volume" "ebs_vol1" {
  availability_zone = aws_instance.prov_os.availability_zone
  size              = 10
  tags = {
    Name = "MY_NEW_VOL"
  }
}

resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/sdn"
  volume_id   = aws_ebs_volume.ebs_vol1.id
  instance_id = aws_instance.prov_os.id
}

resource "null_resource" "nullremote1" {

connection {
  type        = "ssh"
  user        = "ec2-user"
  private_key = file("C:/terrraform_key.pem")
  host        = aws_instance.prov_os.public_ip
 }

provisioner "remote-exec" {
  inline = [
    "sudo yum install httpd -y",
    "sudo yum install php -y",
    "sudo mkfs.ext4 /dev/sdn",
    "sudo mount /dev/sdn /var/www/html",
    "sudo systemctl start httpd",
    "sudo systemctl enable httpd",
    "sudo yum install git -y",
    "sudo git clone https://github.com/Priyu623/webapp.git  /var/www/html/web"
  ]
 }
}

resource "null_resource" "nullremote2" {
  
provisioner "local-exec" {
   command = "chrome http://${aws_instance.prov_os.public_ip}/web/new_index.php"
  }
}

output "opt1" {

value = aws_instance.prov_os

}

output "opt2" {

value = aws_instance.prov_os.public_ip

}



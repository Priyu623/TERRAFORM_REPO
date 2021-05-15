resource "null_resource" "nullremote1" {

depends_on = [
    aws_instance.web_os,
    aws_ebs_volume.storage1,
    aws_volume_attachment.ebs_attach
  ]

connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("C:/terrraform_key.pem")
    host     = aws_instance.web_os.public_ip
  }
provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y ",
      "sudo yum install httpd -y ",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "sudo mkfs.ext4 /dev/sdh",
      "sudo mount /dev/sdh /var/www/html",
      "sudo yum install git -y",
      "sudo git clone https://github.com/Priyu623/webapp.git  /var/www/html/web"
    ]
  }
}

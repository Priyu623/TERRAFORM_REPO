output "my_new_public_ip" {

  value = aws_instance.web_os.public_ip
  
}

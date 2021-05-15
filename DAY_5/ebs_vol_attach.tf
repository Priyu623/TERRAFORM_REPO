resource "aws_volume_attachment" "ebs_attach" {
  
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.storage1.id
  instance_id = aws_instance.web_os.id
  force_detach = true
}

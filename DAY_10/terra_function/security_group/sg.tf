provider "aws" {
  
  region  = "us-east-1"
  profile = "terraform"
  
}

variable "sg_ports"{
  
    type    = list
    default = [80,81,8080,8081]
}

resource "aws_security_group" "sg1" {
  name        = "my_sg"  
  dynamic ingress {
      for_each = var.sg_ports
      content {
        from_port   = ingress.value
        to_port     = ingress.value
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
  }
  
}

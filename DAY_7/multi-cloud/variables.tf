# variable "x" {

#    default = "t2.micro"
#    type = string

# }

# variable "x" {}

# variable "y" {

#    type = bool

# }

# output "op1" {

#    value = var.x

# }

# output "op2" {

#    value = var.y ? "krish" : "tom"

# }
 


# LET'S CREATE OUR FINALL VARIABLES HERE

variable "mtype" {}

variable "istest" {
  
    type = bool
}

variable "azaws" {
  
    default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
    type    = list
}

variable "types" {
  
    type    = map
    default = {
      
        us-east-1  = "t2.micro",
        ap-south-1 = "t2.nano",
        us-west-1  = "t2.medium"
    }
  
}


output "op3" {
  
    value = var.azaws
  
}

output "op4" {
  
    value = var.types["us-east-1"]
  
}


variable "my_var" {

  type = string
  default = "WELCOME TO ALL OF YOU GUYS"

}

output "my_value" {
 
  value = "HII ${var.my_var} HOPE YOU LIKED IT"

}

provider "aws" {
   
  region  = "us-east-1"
  profile = "terraform"
  
}

resource "aws_dynamodb_table" "basic_dynamodb_table" {
  
  name           = "tfstate_lock_table"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"
  
  attribute {
    
    name = "LockID"
    type = "S"
    
  }
  
}
  

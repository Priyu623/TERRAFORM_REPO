provider "aws" {
  
  region  = "us-east-1"
  profile = "terraform"
  
}

provider "google" {
  
  project     ="terraformprod2"
  region      = "asia-south1"
  zone        = "asia-south-c"
  credentials = file("/Downloads/terraformprod2-key.json")
  
}

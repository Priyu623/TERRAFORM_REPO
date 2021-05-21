provider "google" {
  
  project     = "terraformprod1"
  region      = "asia-south1"
  credentials = "terraformprod1-key.json"
  
}

resource "google_compute_instance" "gcp_os1" {
  
  name         = "my_gcp_os1"
  machine_type = "ec2-meduim"
  zone         = "asia-south-c"
  
  boot_disk {
    
    initialize_params {
      
      image = "debian-cloud/debian-9"
      
    }
    
  }
  
  network_interface {
    
    network = "default"
    
  }
  
}  
  
  
  

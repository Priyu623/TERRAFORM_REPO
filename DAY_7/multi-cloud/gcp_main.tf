resource "google_compute_instance" "gcp_os" {
  
  name         = "os1"
  machine_type = var.mtype
  zone         = "asia-south-c"
  count        = var.istest ? 1 : 0
  
  boot_disk {
    
    initialize_params {
      
      image = "debian-cloud/debian-9"
      
    }
    
  }
  
  network_interface {
    
    network = "default"
    
  }
  
}

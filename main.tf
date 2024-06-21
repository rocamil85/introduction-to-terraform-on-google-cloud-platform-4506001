

module "cloud-storage_example_simple_bucket" {
  source  = "terraform-google-modules/cloud-storage/google//examples/simple_bucket"
  version = "6.0.0"
  project_id = "warehousev2-ce0-alas"
}

data "google_compute_image" "ubuntu" {
  most_recent = true
  project     = "ubuntu-os-cloud" 
  family      = "ubuntu-2204-lts"
}

resource "google_compute_instance" "web" {
  name         = "web"
  machine_type = "e2-micro"

  
  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link
    }
  }
  network_interface {
   subnetwork = "default"
   access_config {
      # Leave empty for dynamic public IP
    }
  }  

}

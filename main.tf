resource "google_dataflow_job" "big_data_job" {
  name              = "dataflow-job"
  template_gcs_path = "gs://bucket_dataflow_workbench/challenge_de/"
  temp_gcs_location = "gs://bucket_dataflow_workbench/challenge_de/"
  parameters = {
    foo = "bar"
    baz = "qux"
  }
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

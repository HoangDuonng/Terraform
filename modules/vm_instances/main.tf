resource "google_compute_instance" "vm_instance" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size
    }
  }

  network_interface {
    network = "default"

    access_config {
      # Ephemeral public IP
    }
  }
  
  metadata = {
    ssh-keys = "nguuyen1801:${file("D:/Workspace/Intern/SSH_Keys/.ssh/new-gcp-key.pub")}"
  }
  metadata_startup_script = file("scripts/scripts-install.sh")
}

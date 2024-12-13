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

  metadata_startup_script = file("docker-install.sh")
  # <<-EOF
  #   #!/bin/bash
  #   echo "Starting setup..." > /tmp/startup.log
  #   mkdir -p /tmp/scripts
  #   echo "${file("docker-install.sh")}" > /tmp/scripts/docker-install.sh
  #   echo "${file("jenkins-install.sh")}" > /tmp/scripts/jenkins-install.sh
  #   echo "${file("harbor-install.sh")}" > /tmp/scripts/harbor-install.sh
  #   chmod +x /tmp/scripts/*.sh
  #   /tmp/scripts/docker-install.sh >> /tmp/startup.log 2>&1
  #   /tmp/scripts/jenkins-install.sh >> /tmp/startup.log 2>&1
  #   /tmp/scripts/harbor-install.sh >> /tmp/startup.log 2>&1
  #   echo "Setup completed!" >> /tmp/startup.log
  # EOF


}

# resource "null_resource" "test" {
#     provisioner "local-exec" {
#     command = "echo The server's IP address is ${self.private_ip}"
#   }
# }

# resource "null_resource" "harbor_install" {
#    provisioner "local-exec" {
    
#     command =   "bash ${path.module}/harbor-install.sh"
    
#   }
# }

# resource "null_resource" "jenkins_install" {
#   provisioner "local-exec" {
   
#     command =  "bash ${path.module}/jenkins-install.sh"
    
#   }
# }

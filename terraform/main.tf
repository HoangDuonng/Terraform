module "gcs_bucket" {
  source = "../modules/gcs_bucket"
  bucket_name   = var.bucket_name
  location      = var.location
  storage_class = var.storage_class
  force_destroy = var.force_destroy
  prefixes      = var.prefixes
  project_id    = var.project_id
}

module "vm_instance" {
  source        = "../modules/vm_instances"
  vm_name       = var.vm_name
  machine_type  = var.machine_type
  zone          = var.zone
  disk_size     = var.disk_size
  image         = var.image
  network       = var.network
  host          = module.vm_instance.instance_host
}

resource "null_resource" "scripts-install" {
  depends_on = [module.vm_instance]
  provisioner "file" {
    source      = "scripts/docker-install.sh"
    destination = "/tmp/docker-install.sh"

      connection {
      type     = "ssh"
      user     = "nguuyen1801"
      host     = module.vm_instance.instance_host
      private_key = file("D:/Workspace/Intern/SSH_Keys/.ssh/new-gcp-key")
    }
  }

  provisioner "file" {
    source      = "scripts/harbor-install.sh"
    destination = "/tmp/harbor-install.sh"

    connection {
      type     = "ssh"
      user     = "nguuyen1801"
      host     = module.vm_instance.instance_host
      private_key = file("D:/Workspace/Intern/SSH_Keys/.ssh/new-gcp-key")
    }
  }

  provisioner "file" {
    source      = "scripts/jenkins-install.sh"
    destination = "/tmp/jenkins-install.sh"

    connection {
      type     = "ssh"
      user     = "nguuyen1801"
      host     = module.vm_instance.instance_host
      private_key = file("D:/Workspace/Intern/SSH_Keys/.ssh/new-gcp-key")
    }
  }

  provisioner "file" {
    source      = "scripts/kubernetes-install.sh"
    destination = "/tmp/kubernetes-install.sh"

    connection {
      type     = "ssh"
      user     = "nguuyen1801"
      host     = module.vm_instance.instance_host
      private_key = file("D:/Workspace/Intern/SSH_Keys/.ssh/new-gcp-key")
    }
  }
}

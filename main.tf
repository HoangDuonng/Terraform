module "gcs_bucket" {
  source = "./modules/gcs_bucket"
  bucket_name   = var.bucket_name
  location      = var.location
  storage_class = var.storage_class
  force_destroy = var.force_destroy
  prefixes      = var.prefixes
  project_id    = var.project_id
}

module "vm_instance" {
  source        = "./modules/vm_instances"
  vm_name       = var.vm_name
  machine_type  = var.machine_type
  zone          = var.zone
  disk_size     = var.disk_size
  image         = var.image
  network       = var.network
}
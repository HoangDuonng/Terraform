resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  location      = var.location
  storage_class = var.storage_class
  force_destroy = var.force_destroy
  project       = var.project_id 
}

resource "google_storage_bucket_object" "prefix" {
  for_each = toset(var.prefixes)
  name    = each.value
  bucket  = google_storage_bucket.bucket.name
  content = " "               
}

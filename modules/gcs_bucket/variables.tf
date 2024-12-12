variable "bucket_name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "storage_class" {
  type        = string
}

variable "force_destroy" {
  type        = bool
}

variable "prefixes" {
  type        = list(string)
}

variable "project_id" {
  type        = string
}

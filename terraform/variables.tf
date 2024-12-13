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

variable "vm_name" {
  type        = string
}

variable "machine_type" {
  type        = string
}

variable "zone" {
  type        = string
}

variable "disk_size" {
  type        = number
}

variable "image" {
  type        = string
}

variable "network" {
  type        = string
}

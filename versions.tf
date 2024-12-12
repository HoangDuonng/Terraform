terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.11.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "google" {
    credentials = file("D:\\Workspace\\Key\\codezx-intern-7df19cc7fcb5.json")
    project = var.project_id
    region = "asia-southeast1"
    zone = "asia-southeast1-a"
}

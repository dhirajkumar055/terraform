terraform {
  #  backend "gcs" {
  #    bucket = "tf-states"
  #    prefix = "gcp/company5/prod" 
  #  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.56.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.18.1"
    }
  }
}

provider "google" {
  # Configuration options
  project = "dataloop-candidate-environment"
  region  = "us-east1"
}

provider "kubernetes" {
 config_path = var.kubeconfig
}
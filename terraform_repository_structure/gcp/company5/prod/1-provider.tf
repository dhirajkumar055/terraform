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
  }
}

provider "google" {
  # Configuration options
  project = "dataloop-candidate-environment"
  region  = "asia-south1"
}

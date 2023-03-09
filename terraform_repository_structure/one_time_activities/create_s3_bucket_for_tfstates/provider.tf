terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.56.0"
    }
  }
}

provider "google" {
  # Configuration options
 #  credentials = file(gcloud-keys.json)
  project     = "dataloop-candidate-environment"
  region = "asia-south1"
}

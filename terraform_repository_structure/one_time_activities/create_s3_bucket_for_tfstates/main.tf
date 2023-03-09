resource "google_storage_bucket" "default" {
  name          = "tf-states"
  storage_class = "REGIONAL"
  location      = "asia-south1"
}

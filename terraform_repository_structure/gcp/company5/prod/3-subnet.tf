resource "google_compute_subnetwork" "dheeraj-private-subnet"{
  name = "dheeraj-private-subnet"
  ip_cidr_range = "10.0.0.0/18"
  region = "asia-south1"
  network = default 
  private_ip_google_access = true
  secondary_ip_range {
    range_name = "dheeraj-company5-prod-k8s-pod-range"
    ip_cidr_range = "10.48.0.0/18"
  }
  secondary_ip_range {
    range_name = "dheeraj-company5-prod-k8s-service-range"
    ip_cidr_range = "10.52.0.0/20"
  }
}


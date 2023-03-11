resource "google_compute_subnetwork" "dheeraj-private-subnet"{
  name = "dheeraj-private-subnet"
  ip_cidr_range = "10.160.0.0/22"
  region = "asia-south1"
  network = "default"
  private_ip_google_access = true
  secondary_ip_range {
    range_name = "dheeraj-company5-prod-k8s-pod-range"
    ip_cidr_range = "10.160.4.0/22"
  }
  secondary_ip_range {
    range_name = "dheeraj-company5-prod-k8s-service-range"
    ip_cidr_range = "10.160.8.0/22"
  }
}


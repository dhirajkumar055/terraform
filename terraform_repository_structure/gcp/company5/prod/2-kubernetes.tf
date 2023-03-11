resource "google_container_cluster" "k8s-cluster"{
  name = "dheeraj-company5-prod-gcp-k8s-cluster"
  location = "asia-south1-a"
  remove_default_node_pool = true
  initial_node_count = 1
  #network = google_compute_network.main.self_link
  network = "default" 
  #subnetwork = google_compute_subnetwork.private.self_link
  subnetwork = "default" 
  #logging_service = "logging.googleapis.com/kubernetes"
  #monitoring_service = "monitoring.googleapis.com/kubernetes"
  networking_mode = "VPC_NATIVE"

  node_locations = [
    "asia-south1-b"
  ]
  addons_config {
    http_load_balancing {
      disabled = true
    } 
    horizontal_pod_autoscaling {
      disabled = false
    }
  }
  release_channel{
    channel = "REGULAR"
  }
  workload_identity_config{
    workload_pool = "dataloop-candidate-environment.svc.id.goog"
  }
  ip_allocation_policy{
    #cluster_secondary_range_name = "k8s-pod-range"
    cluster_secondary_range_name = "10.160.0.0/21"
    services_secondary_range_name = "10.160.8.0/21"
    #services_secondary_range_naem = "k8s-service-range"
  }
  private_cluster_config{
    enable_private_nodes = true
    enable_private_endpoint = false
    master_ipv4_cidr_block = "172.16.0.0/28"
  }
}

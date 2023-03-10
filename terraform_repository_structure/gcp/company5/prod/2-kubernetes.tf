resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
}

resource "google_project_service" "container" {
  service = "container.googleapis.com"
}

resource "google_container_cluster" "k8s-cluster"{
  name = "dheeraj-company5-prod-gcp-k8s-cluster"
  location = "us-east1-b"
  remove_default_node_pool = true
  initial_node_count = 1
  #network = google_compute_network.main.self_link
  #network = "default" 
  #subnetwork = google_compute_subnetwork.private.self_link
  #subnetwork = "default" 
  #logging_service = "logging.googleapis.com/kubernetes"
  #monitoring_service = "monitoring.googleapis.com/kubernetes"
  #networking_mode = "ROUTES"

  #release_channel{
  #  channel = "REGULAR"
  #}
  workload_identity_config{
   workload_pool = "${var.project}.svc.id.goog"
  }
  ip_allocation_policy{
    #cluster_secondary_range_name = "pod-ip-secondary-range"
    #services_secondary_range_name = "service-ip-secondary-range"
    #cluster_secondary_range_name = "10.160.0.0/21"
    #services_secondary_range_name = "10.160.8.0/21"
    #cluster_secondary_range_name = "default"
    #services_secondary_range_name = "default"
  }
  private_cluster_config{
    enable_private_nodes = true
    enable_private_endpoint = false
    master_ipv4_cidr_block = "172.16.0.0/28"
  }
}

resource "null_resource" "get-credentials" {

 depends_on = [google_container_cluster.k8s-cluster] 
 
 provisioner "local-exec" {
   command = "gcloud container clusters get-credentials ${google_container_cluster.k8s-cluster.name} --zone=us-east1-b --project dataloop-candidate-environment"
 }
}
resource "kubernetes_namespace" "services" {
  metadata {
    labels = {
      name = "services"
    }
    name = "services"
  }
  depends_on = [null_resource.get-credentials]
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    labels = {
      name = "monitoring"
    }
    name = "monitoring"
  }
  depends_on = [null_resource.get-credentials]
}
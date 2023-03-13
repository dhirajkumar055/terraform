resource "kubernetes_service" "nginx" {
  depends_on = [null_resource.get-credentials]
  metadata {
    name = "svc-nginx"
    namespace = "services"
  }
  spec {
    selector = {
      name = "pod-nginx"
    }
    session_affinity = "ClientIP"
    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_service" "grafana" {
  depends_on = [null_resource.get-credentials]
  metadata {
    name = "svc-grafana"
    namespace = "monitoring"
  }
  spec {
    selector = {
      name = "pod-grafana"
    }
    session_affinity = "ClientIP"
    port {
      port        = 80
      target_port = 3000
    }

    type = "LoadBalancer"
  }
}

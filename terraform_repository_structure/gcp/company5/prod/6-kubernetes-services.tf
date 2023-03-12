resource "kubernetes_service" "nginx" {
  metadata {
    name = "svc-nginx"
    namespace = "services"
  }
  spec {
    selector = {
      name = "nginx"
    }
    session_affinity = "ClientIP"
    port {
      port        = 8080
      target_port = 80
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_service" "grafana" {
  metadata {
    name = "svc-grafana"
    namespace = "monitoring"
  }
  spec {
    selector = {
      name = "grafana"
    }
    session_affinity = "ClientIP"
    port {
      port        = 8080
      target_port = 80
    }

    type = "LoadBalancer"
  }
}

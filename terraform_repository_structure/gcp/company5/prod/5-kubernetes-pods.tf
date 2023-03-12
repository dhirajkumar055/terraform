resource "kubernetes_pod" "pod_nginx" {
  metadata {
    name = "pod_nginx"
    namespace = "services"
  }

  spec {
    container {
      image = "nginx:1.21.6"
      name  = "container_nginx"

      env {
        name  = "environment"
        value = "prod"
      }

      port {
        container_port = 80
        port = 80
      }

      liveness_probe {
        http_get {
          path = "/"
          port = 80

          http_header {
            name  = "X-Custom-Header"
            value = "Awesome"
          }
        }

        initial_delay_seconds = 3
        period_seconds        = 3
      }
    }
  }
}
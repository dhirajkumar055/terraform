resource "kubernetes_pod" "pod-nginx" {
  depends_on = [null_resource.get-credentials]
  metadata {
    name = "pod-nginx"
    namespace = "services"
    labels = {
      name = "pod-nginx"
    }
  }

  spec {
    container {
      image = "nginx:1.21.6"
      name  = "container-nginx"

      env {
        name  = "environment"
        value = "prod"
      }

      port {
        container_port = 80
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


resource "kubernetes_pod" "pod-grafana" {
  depends_on = [null_resource.get-credentials]
  metadata {
    name = "pod-grafana"
    namespace = "monitoring"
    labels = {
      name = "pod-grafana"
    }
  }

  spec {
    container {
      image = "grafana/grafana"
      name  = "container-grafana"

      env {
        name  = "environment"
        value = "prod"
      }

      port {
        container_port = 3000
      }

      liveness_probe {
        http_get {
          path = "/"
          port = 3000

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

resource "kubernetes_pod" "pod-prometheus" {
  depends_on = [null_resource.get-credentials]
  metadata {
    name = "pod-prometheus"
    namespace = "monitoring"
    labels = {
      name = "pod-prometheus"
    }
  }

  spec {
    container {
      image = "bitnami/prometheus"
      name  = "container-prometheus"
      env {
        name  = "environment"
        value = "prod"
      }

      port {
        container_port = 9090
      }

      liveness_probe {
        http_get {
          path = "/"
          port = 9090

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
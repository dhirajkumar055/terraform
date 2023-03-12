resource "kubernetes_namespace" "services" {
  metadata {
    labels = {
      name = "services"
    }
    name = "services"
  }
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    labels = {
      name = "monitoring"
    }
    name = "monitoring"
  }
}
resource "kubernetes_service" "nginx-service" {
  metadata {
    name = "nginx-service"
  }
  spec {
    selector = {
        app = "php-app"
        release = "dev"
        tier = "backend"
    }
    session_affinity = "ClientIP"
    port {
      protocol    = "TCP"
      port        = 80
      target_port = 80
      name        =  "http"
    }

    type = "LoadBalancer"
  }
}
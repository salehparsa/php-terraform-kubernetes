resource "kubernetes_deployment" "php-deployment" {
  metadata {
    name = "terraform-php"
    labels = {
     app = "${var.app_name}"
     release = "${var.release}"
     tier = "${var.tier}"
    }
    namespace = "${var.namespace}"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "${var.app_name}"
        release = "${var.release}"
        tier = "${var.tier}"
      }
    }

    template {
      metadata {
        labels = {
        app = "${var.app_name}"
        release = "${var.release}"
        tier = "${var.tier}"
        }
      }

      spec {

        volume {
            name = "nginx-config-map"
            config_map {
                name  = "nginx-config"
            }
        }
        volume {
            name = "php-config-map"
            config_map {
                name  = "php-config"
            }
        }
        container {
          image = "nginx:latest"
          name  = "nginx"

          port {
              container_port = 80
          }

          resources {
            limits {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/nginx_status"
              port = 80

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }

          volume_mount {
              name = "php-config-map"
              mount_path = "${var.php_mount_path}"
          }

          volume_mount {
              name = "nginx-config-map"
              mount_path = "${var.nginx_mount_path}"
              sub_path =  "nginx.conf"
          }
        }
        container {
          image = "php:7.2-fpm-alpine"
          name  = "php"

          resources {
            limits {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 9000

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }

            volume_mount {
              name = "php-config-map"
              mount_path = "${var.php_mount_path}"
          }
        }
      }
    }
  }
}
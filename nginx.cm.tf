resource "kubernetes_config_map" "nginx" {
  metadata {
    name = "nginx-config"
  }

  data = {
    "nginx.conf" = "${file("${path.module}/config/nginx.conf")}"
  }

}
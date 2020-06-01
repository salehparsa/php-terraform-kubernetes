resource "kubernetes_config_map" "php" {
  metadata {
    name = "php-config"
  }

  data = {
    "index.php" = file("${path.module}/app/index.php")
  }
}


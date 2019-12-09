variable "config_context_auth_info" {
  description = "The Context User from ~/.kube/config"
  default     = "kubernetes-admin"
}

variable "config_context_cluster" {
  description = "The Context Cluster from ~/.kube/config"
  default     = "kubernetes"
}

variable "namespace" {
  description = "Name of the Namespace"
  default     = "default"
}

variable "app_name" {
  description = "Name of the service"
  default     = "php-app"
}

variable "release" {
  description = "Release"
  default     = "dev"
}

variable "tier" {
  description = "Tier"
  default     = "backend"
}

variable "nginx_mount_path" {
  description = "Mount Path of Nginx"
  default     = "/etc/nginx/nginx.conf"
}

variable "php_mount_path" {
  description = "Mount Path of Nginx"
  default     = "/var/www/html"
}
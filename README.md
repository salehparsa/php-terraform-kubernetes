#  (WIP) Deploy PHP on Kubernetes via Terraform

It helps you to deploy PHP application in Kubernetes

### Kubernetes Config

If you have a config file in ```.kube``` folder:

```hcl
variable "config_context_auth_info" {
  description = "The Context User from ~/.kube/config"
  default     = "kubernetes-admin"
}

variable "config_context_cluster" {
  description = "The Context Cluster from ~/.kube/config"
  default     = "kubernetes"
}

```

## Terraform Deployment

Validate the templates:

```
terraform plan
```

Deploy the code:

```
terraform apply
```

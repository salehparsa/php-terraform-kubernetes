#  Deploy PHP on Kubernetes via Terraform

This repo demonstrates how you can deploy a ```hello world``` application in Kubernetes via Terraform.

```
.
├── app
│   └── index.php 
├── config
│   └── nginx.conf
├── deployment.tf
├── nginx.cm.tf
├── php.cm.tf
├── services.tf
└─── main.tf
```

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

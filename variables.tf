variable "eks_subnets" {
  type        = list(string)
  description = "ID of VPC for EKS cluster"
}

variable "cluster_name" {
  type    = string
  description = "Name of the cluster"
}

variable "region" {
  type    = string
  description = "Region for the cluster"
}

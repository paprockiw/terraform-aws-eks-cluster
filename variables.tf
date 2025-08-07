variable "eks_subnets" {
  type        = list(string)
  description = "List of subnet IDs for Fargate usage."
}

variable "fargate_subnets" {
  type        = list(string)
  description = "List of private subnet IDs for Fargate usage."
}

variable "cluster_name" {
  type    = string
  description = "Name of the cluster"
}

variable "region" {
  type    = string
  description = "Region for the cluster"
}

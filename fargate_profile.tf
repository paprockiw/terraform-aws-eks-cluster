resource "aws_eks_fargate_profile" "fargate_prf" {
  cluster_name           = aws_eks_cluster.eks.name
  fargate_profile_name   = "fargate-default"
  pod_execution_role_arn = aws_iam_role.fargate_execution_role.arn
  subnet_ids             = var.eks_subnets

  selector {
    namespace = "default"
  }
}


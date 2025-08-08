resource "aws_iam_role" "fargate_execution_role" {
  name = "eks-fargate-pod-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "eks-fargate-pods.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "fargate_execution" {
  role       = aws_iam_role.fargate_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
}

resource "aws_eks_fargate_profile" "fargate_prf" {
  cluster_name           = aws_eks_cluster.eks.name
  fargate_profile_name   = "web-profile"
  pod_execution_role_arn = aws_iam_role.fargate_execution_role.arn
  subnet_ids             = var.fargate_subnets

  selector {
    namespace = "web"
  }

  depends_on = [
    aws_eks_cluster.eks,
    aws_iam_role_policy_attachment.fargate_execution
  ]
}




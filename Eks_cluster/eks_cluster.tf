resource "aws_eks_cluster" "eks_cluster" {
  name     = "karpenter_eks_cluster_new"
  role_arn = aws_iam_role.eks_cluster_role.arn
  vpc_config {
    subnet_ids = [
      aws_subnet.eks_subnet_a.id,
      aws_subnet.eks_subnet_b.id,
      aws_subnet.eks_private_subnet_a.id,
      aws_subnet.eks_private_subnet_b.id,
    ]
    security_group_ids = [aws_security_group.eks_security_group.id]
  }
}

resource "aws_security_group" "eks_security_group" {
  vpc_id = aws_vpc.eks_vpc.id

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = [aws_vpc.eks_vpc.cidr_block]
    from_port   = 10250
    to_port     = 10250
    protocol    = "tcp"
    description = "Allow communication between EKS nodes (kubelet)"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "Allow SSH access for node troubleshooting"
  }

  tags = {
    Name = "eks-sg"
  }
}
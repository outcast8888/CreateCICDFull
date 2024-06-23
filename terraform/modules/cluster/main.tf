provider "aws" {
  region = var.region
}

data "aws_iam_role" "existing_eks_role" {
  name = var.iam_role_name
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

resource "aws_route_table_association" "subnet_a" {
  subnet_id      = aws_subnet.subnet_a.id
  route_table_id = aws_route_table.main.id
}

resource "aws_route_table_association" "subnet_b" {
  subnet_id      = aws_subnet.subnet_b.id
  route_table_id = aws_route_table.main.id
}

resource "aws_subnet" "subnet_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_a
  availability_zone = var.availability_zone_a
}

resource "aws_subnet" "subnet_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_b
  availability_zone = var.availability_zone_b
}

locals {
  eks_role_arn = try(data.aws_iam_role.existing_eks_role.arn, "")
  eks_role_exists = local.eks_role_arn != ""
}

resource "aws_iam_role" "eks" {
  count = local.eks_role_exists ? 0 : 1
  name  = var.iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "eks.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_eks_cluster" "eks" {
  depends_on = [aws_iam_role.eks]
  name       = var.cluster_name
  role_arn   = local.eks_role_exists ? local.eks_role_arn : aws_iam_role.eks[0].arn

  vpc_config {
    subnet_ids = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
  }
}

resource "aws_iam_role_policy_attachment" "eks" {
  count     = local.eks_role_exists ? 0 : 1
  role      = aws_iam_role.eks[0].name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "eks_service_policy" {
  count     = local.eks_role_exists ? 0 : 1
  role      = aws_iam_role.eks[0].name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
}

# output "subnet_id_a" {
#  value = aws_subnet.subnet_a.id
#}

#output "subnet_id_b" {
#  value = aws_subnet.subnet_b.id
#}

output "eks_cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "eks_cluster_arn" {
  value = aws_eks_cluster.eks.arn
}

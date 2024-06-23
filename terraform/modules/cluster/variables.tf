variable "region" {
  description = "The AWS region to deploy to"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
}

variable "subnet_cidr_a" {
  description = "The CIDR block for the first subnet"
}

variable "subnet_cidr_b" {
  description = "The CIDR block for the second subnet"
}

variable "availability_zone_a" {
  description = "The availability zone for the first subnet"
}

variable "availability_zone_b" {
  description = "The availability zone for the second subnet"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
}

variable "iam_role_name" {
  description = "The name of the IAM role for EKS"
}

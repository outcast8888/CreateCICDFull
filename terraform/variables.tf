variable "region" {
  description = "The AWS region to deploy to"
  default     = "us-east-1"
}

variable "aws_account_id" {
  description = "AWS Account ID"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_a" {
  description = "The CIDR block for the first subnet"
  default     = "10.0.1.0/24"
}

variable "subnet_cidr_b" {
  description = "The CIDR block for the second subnet"
  default     = "10.0.2.0/24"
}

variable "availability_zone_a" {
  description = "The availability zone for the first subnet"
  default     = "us-east-1a"
}

variable "availability_zone_b" {
  description = "The availability zone for the second subnet"
  default     = "us-east-1b"
}

variable "cluster_name" {
  description = "The name of the ECS/EKS cluster"
  default     = "homeFullSys"
}

variable "iam_role_name" {
  description = "The name of the IAM role for EKS"
  default     = "eks-role"
}

variable "subnets" {
  description = "The subnets for the load balancer"
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID where the load balancer will be deployed"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
}

variable "queue_name" {
  description = "The name of the SQS queue"
}
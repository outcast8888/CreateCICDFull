variable "vpc_id" {
  description = "The VPC ID where the load balancer will be deployed"
}

variable "subnets" {
  description = "The subnets for the load balancer"
  type        = list(string)
}

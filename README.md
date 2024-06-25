# CreateCICDFull
DevOps home exam

# Microservices on AWS with Terraform

This project deploys two Docker microservices on AWS using ECS/EKS, S3, Elastic Load Balancer (ELB), and SQS. Terraform is used to provision the infrastructure.

## Project Structure
.
├── modules
│ ├── cluster
│ │ ├── main.tf
│ │ ├── outputs.tf
│ │ └── variables.tf
│ ├── ecr
│ │ ├── main.tf
│ │ ├── outputs.tf
│ │ └── variables.tf
│ ├── ecs
│ │ ├── main.tf
│ │ ├── outputs.tf
│ │ └── variables.tf
│ ├── elb
│ │ ├── main.tf
│ │ ├── outputs.tf
│ │ └── variables.tf
│ ├── s3
│ │ ├── main.tf
│ │ ├── outputs.tf
│ │ └── variables.tf
│ └── sqs
│ ├── main.tf
│ ├── outputs.tf
│ └── variables.tf
├── service1ELB
│ ├── app.py
│ ├── Dockerfile
│ └── requirements.txt
├── service2SQS
│ ├── app.py
│ ├── Dockerfile
│ └── requirements.txt
├── scripts
│ └── push_images.sh
├── main.tf
├── variables.tf
└── terraform.tfvars



## Prerequisites

- AWS CLI installed and configured
- Terraform installed
- Docker installed

## Infrastructure Deployment

1. **Initialize Terraform**

   Navigate to the `project/terraform` directory and initialize Terraform:

   ```bash
   cd project/terraform
   terraform init

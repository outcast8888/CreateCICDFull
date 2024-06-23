#!/bin/bash

REGION="us-east-1"
ACCOUNT_ID="211125604616"
SERVICES=("service1" "service2")

# Authenticate Docker to your ECR registry
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com

for SERVICE in "${SERVICES[@]}"; do
  # Build, tag, and push your images
  docker build -t $SERVICE ../docker/$SERVICE
  docker tag $SERVICE:latest $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$SERVICE:latest
  docker push $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$SERVICE:latest
done

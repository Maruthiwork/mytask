#!/bin/bash
set -e

# Navigate to the deployment directory
cd /var/lib/projects/my-service/

# Authenticate to ECR if you are using private images (Optional)
# aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin <your-account-id>.dkr.ecr.ap-south-1.amazonaws.com

# Pull new images and restart the stack
docker compose down || true
docker compose pull || true
docker compose up -d

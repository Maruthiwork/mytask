#!/bin/bash

set -Eeuo pipefail

APP_DIR="/opt/maruthi-nextjs"
AWS_REGION="ap-south-1"
ECR_URI="358454003381.dkr.ecr.ap-south-1.amazonaws.com/maruthi-nextjs"

echo "Starting Docker Compose deployment..."

cd "$APP_DIR"

if [ ! -f image-tag.txt ]; then
    echo "ERROR: image-tag.txt not found"
    exit 1
fi

IMAGE_TAG=$(cat image-tag.txt)

if [ -z "$IMAGE_TAG" ]; then
    echo "ERROR: Image tag is empty"
    exit 1
fi

export ECR_IMAGE="$ECR_URI"
export IMAGE_TAG

echo "Logging into ECR..."

aws ecr get-login-password --region "$AWS_REGION" \
    | docker login --username AWS --password-stdin "$ECR_URI"

echo "Pulling Docker image: $ECR_URI:$IMAGE_TAG"

docker compose -f compose.yaml config -q
docker compose -f compose.yaml pull
docker compose -f compose.yaml up -d --remove-orphans

echo "Checking containers..."

docker compose -f compose.yaml ps

echo "Deployment completed successfully!"

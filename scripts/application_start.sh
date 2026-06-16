#!/bin/bash

set -e

echo "Logging into ECR..."

aws ecr get-login-password \
--region ap-south-1 | docker login \
--username AWS \
--password-stdin 299834554299.dkr.ecr.ap-south-1.amazonaws.com

echo "Stopping old container..."

docker stop node-app || true

docker rm node-app || true

echo "Pulling latest image..."

docker pull 299834554299.dkr.ecr.ap-south-1.amazonaws.com/node-app:latest

echo "Starting new container..."

docker run -d \
--name node-app \
-p 3000:3000 \
--restart always \
299834554299.dkr.ecr.ap-south-1.amazonaws.com/node-app:latest

echo "Deployment completed successfully"
#!/bin/bash
set -e

# Set the path to the aws executable
AWS_PATH=$(command -v aws)

# Check if aws command exists
if [ -z "$AWS_PATH" ]; then
  echo "Error: aws command not found."
  exit 1
fi

# Authenticate Docker with ECR
$AWS_PATH ecr-public get-login-password --region us-east-1 --no-include-email | docker login --username AWS --password-stdin public.ecr.aws/c3x0j4u6

# Pull the Docker image from ECR
docker pull public.ecr.aws/c3x0j4u6/naveen_ers:latest

# Run the Docker image as a container
docker run -d -p 8000:8000 public.ecr.aws/c3x0j4u6/naveen_ers:latest

# Additional debugging information (optional)
echo "AWS CLI path: $AWS_PATH"
echo "Docker images:"
docker images

# Ensure that the container is running
CONTAINER_ID=$(docker ps -q --filter ancestor=public.ecr.aws/c3x0j4u6/naveen_ers:latest)
if [ -z "$CONTAINER_ID" ]; then
  echo "Error: Container is not running."
  exit 1
fi

# Print container information (optional)
echo "Container is running with ID: $CONTAINER_ID"

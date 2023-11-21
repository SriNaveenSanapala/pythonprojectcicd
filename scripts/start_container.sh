#!/bin/bash
set -e

# Ensure the AWS CLI and Docker commands are in the PATH
export PATH=$PATH:/usr/bin

# Authenticate Docker with ECR
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/c3x0j4u6

# Pull the Docker image from ECR
docker pull public.ecr.aws/c3x0j4u6/naveen_ers:latest

# Run the Docker image as a container
docker run -d -p 8000:5000 public.ecr.aws/c3x0j4u6/naveen_ers:latest

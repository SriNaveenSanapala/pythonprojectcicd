#!/bin/bash
set -e

# Authenticate Docker with ECR
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/c3x0j4u6

# Pull the Docker image from ECR
docker pull public.ecr.aws/c3x0j4u6/naveen_ers:latest

# Run the Docker image as a containers
docker run -d -p 5000:5000  public.ecr.aws/c3x0j4u6/naveen_ers:latest

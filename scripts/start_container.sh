#!/bin/bash
set -e

# Authenticate Docker with ECR
/usr/bin/aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/c3x0j4u6
# Pull the Docker image from ECR
/usr/bin/docker pull public.ecr.aws/c3x0j4u6/naveen_ers:latest
# Run the Docker image as a containers
/usr/bin/docker run -d -p 8000:5000 public.ecr.aws/c3x0j4u6/naveen_ers:latest

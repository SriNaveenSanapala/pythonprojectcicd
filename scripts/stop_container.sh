#!/bin/bash
set -e

# Find the ID of the running container by filtering it based on your application image
CONTAINER_ID=$(sudo docker ps -q --filter ancestor=public.ecr.aws/c3x0j4u6/naveen_ers:latest)

# Print the container ID for debugging
echo "Container ID: $CONTAINER_ID"

# Check if the container is running
if [ -n "$CONTAINER_ID" ]; then
    # Stop the running container
    echo "Stopping container..."
    sudo docker stop "$CONTAINER_ID"
    
    # Additional debugging information (optional)
    echo "Stopped container with ID: $CONTAINER_ID"
else
    echo "No running container found for the specified image."
fi

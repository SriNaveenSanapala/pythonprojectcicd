#!/bin/bash

# Get the ID of the running container
CONTAINER_ID=$(docker ps -q --filter "publish=8000")

# Check if the container is running
if [ -n "$CONTAINER_ID" ]; then
    # Print the container ID for debugging
    echo "Container ID: $CONTAINER_ID"
    
    # Stop the running container
    docker stop "$CONTAINER_ID"
    
    # Additional debugging information (optional)
    echo "Stopped container with ID: $CONTAINER_ID"
else
    echo "No running container found for the specified image."
fi

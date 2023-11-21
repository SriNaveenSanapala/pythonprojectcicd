#!/bin/bash

# Get the IDs of running containers publishing port 8000
running_containers=$(sudo docker ps -q --filter "publish=8000")

# Output the IDs for debugging
echo "Containers to stop:"
echo "$running_containers"

# Stop each container
while IFS= read -r container_id; do
    echo "Stopping container $container_id..."
    sudo docker stop "$container_id"
    stop_exit_code=$?

    # Print the exit code for debugging
    echo "Exit code: $stop_exit_code"
    
    if [ $stop_exit_code -eq 0 ]; then
        echo "Successfully stopped container $container_id"
    else
        echo "Failed to stop container $container_id"
    fi
done <<< "$running_containers"

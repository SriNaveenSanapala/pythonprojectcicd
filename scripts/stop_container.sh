#!/bin/bash
set -e

# Stop and remove the running container
docker stop $(docker ps -q --filter ancestor=public.ecr.aws/c3x0j4u6/naveen_ers:latest)
docker rm $(docker ps -a -q --filter ancestor=public.ecr.aws/c3x0j4u6/naveen_ers:latest)

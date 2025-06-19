#!/bin/bash

# Stop any existing container using port 80
docker ps -q --filter "publish=80" | grep -q . && docker stop $(docker ps -q --filter "publish=80")

# Pull latest image
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 060795913786.dkr.ecr.us-east-1.amazonaws.com
docker pull 060795913786.dkr.ecr.us-east-1.amazonaws.com/cap4-app-dev:latest

# Run new container
docker run -d -p 80:80 060795913786.dkr.ecr.us-east-1.amazonaws.com/cap4-app-dev:latest

#!/bin/bash

# Stop any existing container
docker stop cap4-app-dev || true
docker rm cap4-app-dev || true

# Pull latest image from ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 060795913786.dkr.ecr.us-east-1.amazonaws.com

docker pull 060795913786.dkr.ecr.us-east-1.amazonaws.com/cap4-app-dev:latest

# Run new container
docker run -d --name cap4-app-dev -p 80:80 060795913786.dkr.ecr.us-east-1.amazonaws.com/cap4-app-dev:latest

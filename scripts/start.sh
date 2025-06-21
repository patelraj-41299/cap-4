#!/bin/bash

# Stop any existing container on port 80
docker ps -q --filter "publish=80" | grep -q . && docker stop $(docker ps -q --filter "publish=80")

# Build and run the Stylish WebApp container
docker build -t stylish-app /home/ec2-user/stylish-app
docker run -d -p 80:80 stylish-app

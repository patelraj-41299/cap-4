#!/bin/bash

# Stop old container if running
docker ps -q --filter "publish=80" | grep -q . && docker stop $(docker ps -q --filter "publish=80")

# Build & run new container
docker build -t stylish-app /home/ec2-user/stylish-app
docker run -d -p 80:80 stylish-app

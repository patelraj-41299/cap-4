#!/bin/bash
docker stop $(docker ps -q) || true
docker rm $(docker ps -a -q) || true
docker pull 060795913786.dkr.ecr.us-east-1.amazonaws.com/cap4-app-dev:latest
docker run -d -p 80:80 060795913786.dkr.ecr.us-east-1.amazonaws.com/cap4-app-dev:latest

#!/bin/bash

# Stop all running containers
docker ps -q | grep -q . && docker stop $(docker ps -q)

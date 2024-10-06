#!/bin/bash

# Usage: ./deploy.sh <IMAGE_NAME> <IMAGE_TAG> <PORT>
IMAGE_NAME=$1
IMAGE_TAG=$2
PORT=$3

echo "Pulling Docker image: ${IMAGE_NAME}:${IMAGE_TAG}"
docker pull ${IMAGE_NAME}:${IMAGE_TAG}

echo "Stopping existing container (if any)..."
docker stop flask_app || true
docker rm flask_app || true

echo "Starting new container..."
docker run -d --name flask_app -p ${PORT}:5000 ${IMAGE_NAME}:${IMAGE_TAG}

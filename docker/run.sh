#!/bin/bash

# Docker image name
IMAGE_NAME="rdclab/lang-segment-anything:latest"

# Check if the image exists locally
if ! docker image inspect $IMAGE_NAME > /dev/null 2>&1; then
  echo "Docker image '$IMAGE_NAME' not found locally. Pulling from Docker Hub..."
  docker pull $IMAGE_NAME
fi

# Open the Gradio interface in the default browser
xdg-open http://localhost:8000/gradio &

# Run the Docker container with GPU and port mapping
docker run --gpus all -p 8000:8000 $IMAGE_NAME
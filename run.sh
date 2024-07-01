#!/usr/bin/env sh

IMAGE_NAME="doom-emacs"

HOST_DIR="$HOME"

if docker image inspect $IMAGE_NAME > /dev/null 2>&1; then
    echo "Running the Docker container with host directory mounted: $HOST_DIR"
    docker run -it -v $HOST_DIR:/mnt/host $IMAGE_NAME
else
    echo "Docker image $IMAGE_NAME does not exist. Please build the image first."
fi

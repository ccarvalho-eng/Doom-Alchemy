#!/usr/bin/env sh

# Usage:
# ./run.sh [IMAGE_NAME]
#
# If IMAGE_NAME is provided, it will be used as the Docker image name.
# Otherwise, it defaults to "doom-emacs".
#
# Example:
# ./run.sh my-custom-image
# This will run a Docker container with the name "my-custom-image".
#
# ./run.sh
# This will run a Docker container with the default name "doom-emacs".

IMAGE_NAME=${1:-doom-emacs}

HOST_DIR="$HOME"

if docker image inspect $IMAGE_NAME > /dev/null 2>&1; then
    echo "Running the Docker container with host directory mounted: $HOST_DIR"
    docker run -it -v $HOST_DIR:/mnt/host $IMAGE_NAME
else
    echo "Docker image $IMAGE_NAME does not exist. Please build the image first."
fi

#!/usr/bin/env sh

# Usage:
# ./build.sh [IMAGE_NAME]
#
# If IMAGE_NAME is provided, it will be used as the Docker image name.
# Otherwise, it defaults to "doom-emacs".
#
# Example:
#
# ./build.sh my-custom-image
# This will build and run a Docker container with the name "my-custom-image".
#
# ./build.sh
# This will build and run a Docker container with the default name "doom-emacs".

IMAGE_NAME=${1:-doom-emacs}

HOST_DIR="$HOME"

if docker image inspect $IMAGE_NAME > /dev/null 2>&1; then
    echo "Image $IMAGE_NAME already exists. Deleting..."
    docker rmi -f $IMAGE_NAME
fi

echo "Building the Docker image..."
docker build -t $IMAGE_NAME .

if [ $? -eq 0 ]; then
    echo "Docker image built successfully."
    echo "Running the Docker container with host directory mounted: $HOST_DIR"
    docker run -it -v $HOST_DIR:/mnt/host $IMAGE_NAME
else
    echo "Docker image build failed."
fi

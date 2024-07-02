#!/usr/bin/env sh

# Usage:
# ./build.sh [IMAGE_NAME] [ELIXIR_VERSION]
#
# If IMAGE_NAME is provided, it will be used as the Docker image name.
# Otherwise, it defaults to "doom-emacs".
#
# ELIXIR_VERSION is optional. If provided, it specifies the version of Elixir to use.
# If not provided, the Dockerfile will use the latest version of Elixir.
#
# Example:
# ./build.sh my-custom-image 1.12
# This will build and run a Docker container with the name "my-custom-image"
# using Elixir version 1.12.
#
# ./build.sh my-custom-image
# This will build and run a Docker container with the name "my-custom-image"
# using the latest version of Elixir.
#
# ./build.sh
# This will build and run a Docker container with the default name "doom-emacs"
# using the latest version of Elixir.

IMAGE_NAME=${1:-doom-emacs}
ELIXIR_VERSION=${2:-latest}  # Default to latest if not provided

HOST_DIR="$HOME"

if docker image inspect $IMAGE_NAME > /dev/null 2>&1; then
    echo "Image $IMAGE_NAME already exists. Deleting..."
    docker rmi -f $IMAGE_NAME
fi

echo "Building the Docker image $IMAGE_NAME with Elixir version $ELIXIR_VERSION..."
docker build --build-arg ELIXIR_VERSION=$ELIXIR_VERSION -t $IMAGE_NAME .

if [ $? -eq 0 ]; then
    echo "Docker image built successfully."
    echo "Running the Docker container with host directory mounted: $HOST_DIR"
    docker run -it -v $HOST_DIR:/mnt/host $IMAGE_NAME
else
    echo "Docker image build failed."
fi

#!/usr/bin/env sh

IMAGE_NAME=${1:-doom-emacs}
ELIXIR_VERSION=${2:-latest}

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

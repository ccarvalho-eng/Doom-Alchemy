#!/usr/bin/env sh

IMAGE_NAME="doom-emacs"

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

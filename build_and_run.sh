#!/usr/bin/env sh

# Set the image name
IMAGE_NAME="doom-emacs"

# Directory to mount into the Docker container
HOST_DIR="$HOME"

# Check if the image already exists
if docker image inspect $IMAGE_NAME > /dev/null 2>&1; then
    echo "Image $IMAGE_NAME already exists. Deleting..."
    docker rmi -f $IMAGE_NAME
fi

# Build the new image
echo "Building the Docker image..."
docker build -t $IMAGE_NAME .

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo "Docker image built successfully."

    # Run a container from the image, mounting the host directory
    echo "Running the Docker container with host directory mounted: $HOST_DIR"
    docker run -it -v $HOST_DIR:/mnt/host $IMAGE_NAME
else
    echo "Docker image build failed."
fi

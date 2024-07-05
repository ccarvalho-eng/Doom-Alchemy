## Doom Alchemy

This project provides a Docker setup for running Doom Emacs with Elixir support. It includes installation steps for Emacs, necessary development tools, Doom Emacs configuration, fonts, and Elixir LS (Language Server) for enhanced development capabilities.

## Prerequisites

- Docker: Ensure Docker is installed on your system. You can download it from [docker.com](https://www.docker.com/get-started).

## Getting Started

### Building the Docker Image

```bash
# Build with default settings (doom-emacs with latest Elixir)
docker compose up

# Build with custom project name and a speficic Elixir version
docker compose -p custom-project-name build --build-arg ELIXIR_VERSION=1.17
``` 

## Running the Docker Container

```bash
# Run container with default image name (doom-emacs)
docker compose run doom-emacs

# Run custom image with mounted directory, in case you built and image for 
# a speficic project.
docker run -it -v $HOST_DIR:/mnt/host $IMAGE_NAME
```

## Mounting Host Directory

To access files from your host system within the Docker container, the `run.sh`
script mounts the host directory under the /mnt/host directory inside the
container. You can change the host directory path as needed by modifying the
`run.sh` script.

## Configuration
### Customizing Emacs and Doom Emacs

You can customize Emacs and Doom Emacs configurations by modifying the files
under `config/` directory before building the Docker image.


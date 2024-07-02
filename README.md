# Doom Emacs Image

This project provides a Docker setup for running Doom Emacs with Elixir support. It includes installation steps for Emacs, necessary development tools, Doom Emacs configuration, fonts, and Elixir LS (Language Server) for enhanced development capabilities.

## Prerequisites

- Docker: Ensure Docker is installed on your system. You can download it from [docker.com](https://www.docker.com/get-started).

## Getting Started

### Building the Docker Image

To build the Docker image, you can use the provided `build.sh` script. This script allows you to specify the Docker image name and optionally the version of Elixir.

```bash
# Build with default settings (doom-emacs with latest Elixir)
./build.sh

# Build with custom image name and Elixir version
./build.sh my-custom-image 1.12

``` 

# Running the Docker Container

Once the image is built, you can run the Docker container using the `run.sh` script. This script also allows specifying the Docker image name.

```bash
# Run container with default image name (doom-emacs)
./run.sh

# Run container with custom image name
./run.sh my-custom-image
```

# Configuration
## Customizing Emacs and Doom Emacs

You can customize Emacs and Doom Emacs configurations by modifying the files
under `config/` directory before building the Docker image.

# Changing Elixir Version

To use a different version of Elixir, specify the ELIXIR_VERSION argument when
running `build.sh`.


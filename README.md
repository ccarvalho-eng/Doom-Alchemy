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
docker compose build --build-arg ELIXIR_VERSION=1.17
``` 

## Running the Docker Container

```bash
# Run a service
docker compose run doom-emacs
```

## Configuration
### Customizing Emacs and Doom Emacs

You can customize Emacs and Doom Emacs configurations by modifying the files
under `config/` directory before building the Docker image.


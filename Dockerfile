# Use the base Elixir image
ARG ELIXIR_VERSION=latest
FROM elixir:${ELIXIR_VERSION}

# Install necessary packages
RUN apt-get update \
    && apt-get install -y \
       emacs \
       cmake \
       libtool \
       libvterm-dev \
       fontconfig \
       git \
       curl

# Clone Doom Emacs and set it up
RUN git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs \
    && echo "y" | ~/.config/emacs/bin/doom env \
    && yes "y" | ~/.config/emacs/bin/doom install

# Copy Emacs configuration files
COPY config/config.el config/init.el config/packages.el /root/.config/doom/

# Install all-the-icons font and cache
RUN git clone https://github.com/domtronn/all-the-icons.el /tmp/all-the-icons \
    && cp /tmp/all-the-icons/fonts/* /usr/local/share/fonts/ \
    && fc-cache -f -v

# Install Elixir LS
RUN git clone https://github.com/elixir-lsp/elixir-ls ~/.elixir-ls \
    && cd ~/.elixir-ls \
    && mix local.hex --force \
    && mix deps.get \
    && MIX_ENV=prod mix compile \
    && MIX_ENV=prod mix elixir_ls.release2

# Run doom sync to ensure all packages are installed
RUN ~/.config/emacs/bin/doom sync

# Set the entrypoint for the container
ENTRYPOINT ["emacs"]

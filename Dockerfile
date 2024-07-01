FROM elixir:latest

RUN apt-get update \
    && apt-get install -y \
    emacs \
    cmake \
    libtool \
    libvterm-dev \
    fontconfig \
    git \
    curl

RUN git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs \
    && echo "y" | ~/.config/emacs/bin/doom env \
    && yes "y" | ~/.config/emacs/bin/doom install

COPY config/config.el config/init.el config/packages.el /root/.config/doom/

RUN git clone https://github.com/domtronn/all-the-icons.el /tmp/all-the-icons \
    && cp /tmp/all-the-icons/fonts/* /usr/local/share/fonts/ \
    && fc-cache -f -v

RUN ~/.config/emacs/bin/doom sync

RUN git clone https://github.com/elixir-lsp/elixir-ls ~/.elixir-ls \
    && cd ~/.elixir-ls \
    && mix local.hex --force \
    && mix deps.get \
    && MIX_ENV=prod mix compile \
    && MIX_ENV=prod mix elixir_ls.release2

ENTRYPOINT ["emacs"]

FROM elixir:latest

RUN apt-get update \
    && apt-get install -y emacs

RUN git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs \
    && echo "y" | ~/.config/emacs/bin/doom env \
    && yes "y" | ~/.config/emacs/bin/doom install

RUN git clone https://github.com/elixir-lsp/elixir-ls ~/.elixir-ls \
    && cd ~/.elixir-ls \
    && mix local.hex --force \
    && mix deps.get \
    && MIX_ENV=prod mix compile \
    && MIX_ENV=prod mix elixir_ls.release2

ENTRYPOINT ["emacs"]

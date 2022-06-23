#!/usr/bin/env bash
set -eufo pipefail

asdf plugin add direnv https://github.com/asdf-community/asdf-direnv.git || true
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git || true
asdf plugin-add python https://github.com/danhper/asdf-python.git || true
asdf plugin-add poetry https://github.com/asdf-community/asdf-poetry.git || true
asdf plugin-add rust https://github.com/code-lever/asdf-rust.git || true
asdf plugin-add asdf-golang https://github.com/kennyp/asdf-golang.git || true
asdf plugin-add java https://github.com/halcyon/asdf-java.git || true

asdf install direnv latest
asdf global direnv latest
asdf direnv setup --shell bash --version latest
asdf direnv setup --shell fish --version latest

asdf install nodejs latest
asdf install python latest
asdf install rust latest
asdf install asdf-golang latest

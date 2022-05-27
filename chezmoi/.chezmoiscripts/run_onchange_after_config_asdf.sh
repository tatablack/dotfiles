#!/usr/bin/env bash
set -eufo pipefail

asdf plugin add direnv https://github.com/asdf-community/asdf-direnv.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add python https://github.com/danhper/asdf-python.git
asdf plugin-add rust https://github.com/code-lever/asdf-rust.git
asdf plugin-add asdf-golang https://github.com/kennyp/asdf-golang.git

asdf install direnv latest
asdf global direnv latest

asdf install nodejs latest
asdf global nodejs latest

asdf install python latest
asdf global python latest

asdf install rust latest

asdf install golang latest

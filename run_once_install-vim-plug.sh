#!/bin/sh

curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if command -v nvim &> /dev/null
then
	nvim +PlugUpgrade +qall
	nvim +PlugInstall +qall
fi


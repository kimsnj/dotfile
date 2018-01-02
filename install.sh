#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# zsh
if [[ ! -e ~/.zshrc ]]; then
    echo "Setting up ZSH with SlimZsh"
    mkdir ~/.config/zsh
    $(cd ~/.config/zsh/ && git clone --recursive https://github.com/changs/slimzsh.git ~/.slimzsh)
    ln -s ${BASEDIR}/.zshrc ~/.zshrc
fi

# emacs
if [[ ! -e ~/.spacemacs ]]; then
    echo "Setting up Emacs with Spacemacs"
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
    ln -s ${BASEDIR}/.spacemacs ~/.spacemacs
fi

# vim
if [[ ! -e ~/.vimrc  ]]; then
    echo "Setting up VIM for bépo layout"
    ln -s ${BASEDIR}/vim ~/.config/vim
    ln -s ${BASEDIR}/.vimrc ~/.vimrc
fi


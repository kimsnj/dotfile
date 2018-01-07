#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# zsh
if [[ ! -e ~/.zshrc ]]; then
    echo "Setting up ZSH with SlimZsh"
    mkdir ~/.config/zsh
    $(cd ~/.config/zsh/ && git clone --recursive https://github.com/changs/slimzsh.git slimzsh)
    ln -s ${BASEDIR}/.zshrc ~/.zshrc
fi

# emacs
if [[ ! -e ~/.spacemacs ]]; then
    echo "Setting up Emacs with Spacemacs"
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
    ln -s ${BASEDIR}/.spacemacs ~/.spacemacs
fi

# (neo)vim
if [[ ! -e ~/.vimrc  ]]; then
    echo "Setting up VIM for bépo layout and vim-plug"
    ln -s ${BASEDIR}/nvim ~/.config/nvim
    ln -s ${BASEDIR}/nvim/init.vim ~/.vimrc

    # vim-plug for vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # and for neovim
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# alacritty terminal
if [[ ! -e .config/alacritty ]]; then
   echo "Setting up Alacritty"
   mkdir -p ~/.config/alacritty
   ln -s ${BASEDIR}/alacritty.yml ~/.config/alacritty/alacritty.yml
fi

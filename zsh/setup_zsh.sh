#!/bin/bash
OSTYPE=`uname`

if [ $OSTYPE == 'Linux' ]; then
  yum -y install zsh 
fi

cd ~

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
git clone https://github.com/sivakalyanc/dotfiles

chsh -s /bin/zsh

if [ $OSTYPE == 'Linux' ]; then
  ln -s ~/dotfiles/zsh/zshrc_centos ~/.zshrc
else
  ln -s ~/dotfiles/zsh/zshrc_mac ~/.zshrc
fi

exec zsh


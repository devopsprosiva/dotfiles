#!/bin/bash
OSTYPE=`uname`

if [ $OSTYPE == 'Linux' ]; then
  yum -y install zsh 
fi

cd ~

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

chsh -s /bin/zsh

if [ $OSTYPE == 'Linux' ]; then
  ln -s ~/dotfiles/zsh/zshrc_centos ~/.zshrc
  ln -s ~/dotfiles/zsh/prompt_sivac_setup_centos ~/.zprezto/modules/prompt/functions/prompt_sivac_setup
else
  ln -s ~/dotfiles/zsh/zshrc_mac ~/.zshrc
  ln -s ~/dotfiles/zsh/prompt_sivac_setup_mac ~/.zprezto/modules/prompt/functions/prompt_sivac_setup
fi

ln -s ~/dotfiles/zsh/zpreztorc ~/.zpreztorc


exec zsh


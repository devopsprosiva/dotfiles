#!/bin/bash

OSTYPE=`uname`

if [ -f ~/.vimrc ]; then
  mv ~/.vimrc ~/.vimrc.bkp.`date +'%D-%T'`
else
  if [ -L ~/.vimrc ]; then
    rm -f ~/.vimrc
  fi
fi

if [ $OSTYPE == 'Linux' ]; then
  ln -s ~/dotfiles/vim/vimrc_centos ~/.vimrc
else
  ln -s ~/dotfiles/vim/vimrc_mac ~/.vimrc
fi

vim +BundleInstall +qall
vim +qall

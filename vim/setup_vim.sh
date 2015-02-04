#!/bin/bash

if [ -f ~/.vimrc ]; then
  mv ~/.vimrc ~/.vimrc.bkp.`date +'%D-%T'`
else
  if [ -L ~/.vimrc ]; then
    rm -f ~/.vimrc
  fi
fi

ln -s `pwd`/vimrc ~/.vimrc

vim +BundleInstall +qall
vim +qall

#!/bin/bash

if [ -f ~/.vimrc ]; then
  mv ~/.vimrc ~/.vimrc.bkp
fi
  
ln -s `pwd`/vimrc ~/.vimrc
vim +BundleInstall +qall
vim +qall

#!/bin/bash

if [ -f ~/.vimrc ]; then
  mv ~/.vimrc ~/.vimrc.bkp.`date +'%D-%T'`
else
  if [ -L ~/.vimrc ]; then
    rm -f ~/.vimrc
  fi
fi

if [ -d ~/.vim ]; then
  mv ~/.vim ~/.vim.bkp.`date +'%D-%T'`
fi
  
ln -s `pwd`/vimrc ~/.vimrc
ln -s `pwd`/vim ~/.vim

vim +BundleInstall +qall
vim +qall

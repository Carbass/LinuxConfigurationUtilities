#!/bin/bash

# Includes the following plugins
# Vundle
# vim-airline
# vim-fugitive
# nerdtree

case "$1" in
        install)
	    sudo apt-get update
	    sudo apt-get install git
	    sudo apt-get install vim

	    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

	    chmod 744 /etc/vim/vimrc
	    echo "set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
set laststatus=2
set t_Co=256
call vundle#end()

filetype plugin indent on" >> /etc/vim/vimrc

	    chmod 644 /etc/vim/vimrc	   
	    vim +PluginInstall +qall 

            ;;
         
        uninstall)
	    sudo apt-get purge vim
	    sudo apt-get autoremove
	    rm -rf ~/.vim
            ;;
        *)
esac

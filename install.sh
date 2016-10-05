#!/usr/bin/env bash

ln -nfs $PWD/.Xresources ~/.Xresources
ln -nfs $PWD/.bash_profile ~/.bash_profile
ln -nfs $PWD/.colors ~/.colors
ln -nfs $PWD/.ctags ~/.ctags 
ln -nfs $PWD/.eslintrc ~/.eslintrc 
ln -nfs $PWD/.git_template ~/.git_template 
ln -nfs $PWD/.gitconfig ~/.gitconfig 
ln -nfs $PWD/.gitignore ~/.gitignore 
ln -nfs $PWD/.global_ignore ~/.global_ignore 
ln -nfs $PWD/.tmux ~/.tmux 
ln -nfs $PWD/.tmux.conf ~/.tmux.conf 
ln -nfs $PWD/.wallpaper ~/.wallpaper 

ln -nfs $PWD/.vim/* ~/.vim/
ln -nfs $PWD/.vimrc ~/.vimrc

mkdir -p ~/.config/nvim

ln -nfs $PWD/.config/* ~/.config/
ln -nfs $PWD/.vim/* ~/.config/nvim/
ln -nfs $PWD/.vimrc ~/.config/nvim/init.vim

PATH_TO_APPEND=$(echo $PATH | cut -d':' -f 1)
PATH_TO_READ=$PWD/path
FILES=$(ls $PATH_TO_READ)
for file in $FILES; do
  ln -nfs $PATH_TO_READ/$file $PATH_TO_APPEND/$file
  echo "symlinked $PATH_TO_READ/$file to $PATH_TO_APPEND/$file"
done

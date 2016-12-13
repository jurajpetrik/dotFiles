#!/usr/bin/env bash

ln -nfs $PWD/.Xresources ~/.Xresources
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

echo "now?" # something buggy happens here
ln -nfs $PWD/.vim/* ~/.vim/
echo "?now"
ln -nfs $PWD/.vimrc ~/.vimrc

mkdir -p ~/.config/nvim

ln -nfs $PWD/.config/* ~/.config/
ln -nfs $PWD/.vim/* ~/.config/nvim/
ln -nfs $PWD/.vimrc ~/.config/nvim/init.vim

ln -nfs $PWD/.zshrc ~/.zshrc
ln -nfs $PWD/.oh-my-zsh ~/.oh-my-zsh
ln -nfs $PWD/.alias ~/.alias
ln -nfs $PWD/.zshenv ~/.zshenv
ln -nfs $PWD/.zlogin ~/.zlogin

ln -nfs $PWD/.tmuxinator ~/.tmuxinator

PATH_TO_APPEND=$(echo $PATH | cut -d':' -f 1)
PATH_TO_READ=$PWD/path
FILES=$(ls $PATH_TO_READ)
for file in $FILES; do
  ln -nfs $PATH_TO_READ/$file $PATH_TO_APPEND/$file
  echo "symlinked $PATH_TO_READ/$file to $PATH_TO_APPEND/$file"
done

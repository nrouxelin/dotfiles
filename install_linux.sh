#!/bin/bash

dir=$(pwd)

# Files to consider
files=".vimrc .tmux.conf .vim .bash_alias"

backup_dir=~/old_dotfiles
echo "Creating $backup_dir to backup any existing dotfile"
mkdir -p $backup_dir

for file in $files
do
  if [ -f "$file" ];
  then
    echo "Back-up existing dotfiles to $backup_dir"
    mv ~/$file $backup_dir/
  fi
  echo "Creating symlink to $file in the home directory"
  ln -s $dir/$file ~/$file
done

s=$(cat ~/.bashrc | grep "source ~/.bash_alias")
if [ -z $s ];
then
  echo "Sourcing bash_alias"
  echo "source ~/.bash_alias" >> ~/.bashrc
fi

echo "Sourcing new bash config"
source ~/.bashrc

# installing vim plug-ins
cd ~/.vim
git clone https://github.com/dracula/vim.git bundle/dracula
git clone https://github.com/itchyny/lightline.vim.git bundle/lightline.vim


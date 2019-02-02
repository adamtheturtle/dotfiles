#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

set -euxo pipefail

########## Variables

dir=~/Documents/dotfiles                    # dotfiles directory
olddir=~/Documents/dotfiles_old             # old dotfiles backup directory
files="config/fish/config.fish config/nvim/init.vim tmux.conf ssh/config pypirc"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
rm -rf $olddir
mkdir $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

mkdir -p ~/.config/fish
mkdir -p ~/.config/nvim
# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir || true
    echo "Creating symlink to $file in home directory."
    containing_dir=$(dirname ~/.$file)
    mkdir -p $containing_dir
    ln -s $dir/$file ~/.$file
done

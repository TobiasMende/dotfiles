#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles
############################

########## Variables

dir=~/.dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
dotfiles="vim/vimrc vim/vim vim/viminfo zsh/zprezto zsh/zsh zsh/zsh-autosuggestions"
preztofiles="zlogin zlogout zpreztorc zprofile zshenv zshrc"
##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 


echo "Backing up existing files"
for file in $dotfiles; do
	name=$(basename $file)
    mv ~/.$name $olddir/
done
for file in $preztofiles; do
	mv ~/.$file $olddir/
done
echo "...done"

echo "Moving any existing dotfiles from ~ to $olddir"
for file in $dotfiles; do
    name=$(basename $file)
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$name
done
echo "...done"
echo "Symlinking zprezto files"
#Symlink zprezto-files
for file in $preztofiles; do
	echo "Creating symlink to $file in home directory."
	ln -s $dir/zsh/zprezto/runcoms/$file ~/.$file
done
echo "...done"
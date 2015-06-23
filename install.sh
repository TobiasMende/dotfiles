#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles
############################

########## Variables

dir=~/.dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
dotfiles="vim/vimrc vim/vim zsh/zsh zsh/zlogin zsh/zlogout zsh/zpreztorc zsh/zprofile zsh/zshenv zsh/zshrc tmux/tmux.conf"
##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
echo "Changing to the $dir directory"
cd $dir
echo "...done"
mkdir vim/vim/backups
# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 


echo "Backing up existing files"
for file in $dotfiles; do
	name=$(basename $file)
    mv ~/.$name $olddir/
done
echo "...done"

echo "Moving any existing dotfiles from ~ to $olddir"
for file in $dotfiles; do
    name=$(basename $file)
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$name
done
echo "...done"

echo "TODO: Set zsh as default shell: chsh -s /bin/zsh"
echo "TODO: install vimpager (https://github.com/rkitover/vimpager.git)"

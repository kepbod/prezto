#!/usr/bin/env bash

warn ()
{
    printf '\033[0;31m%s\033[0m\n' "$1" >&2
}

die ()
{
    warn "$1"
    exit 1
}

printf '\033[0;34m%s\033[0m\n' "Thanks for installing prezto!"
printf '\033[0;34m%s\033[0m\n' "                     _        "
printf '\033[0;34m%s\033[0m\n' "                    | |       "
printf '\033[0;34m%s\033[0m\n' "  _ __  _ __ ___ ___| |_ ___  "
printf '\033[0;34m%s\033[0m\n' " | '_ \| '__/ _ \_  / __/ _ \ "
printf '\033[0;34m%s\033[0m\n' " | |_) | | |  __// /| || (_) |"
printf '\033[0;34m%s\033[0m\n' " | .__/|_|  \___/___|\__\___/ "
printf '\033[0;34m%s\033[0m\n' " | |                          "
printf '\033[0;34m%s\033[0m\n' " |_|                          "

# check requirements
printf '\033[0;34m%s\033[0m\n' "Checking requirements for prezto..."
printf '\033[0;34m%s\033[0m\n' "Checking if zsh exists..."
which zsh || die "No zsh installed!\nPlease install zsh from http://http://www.zsh.org/"
printf '\033[0;34m%s\033[0m\n' "Checking if git exists..."
which git || die "No git installed!\nPlease install git from http://git-scm.com/downloads/"

# back up existing zsh stuff
printf '\033[0;34m%s\033[0m\n' "Backing up current zsh config..."
for i in $HOME/.z{login,logout,preztorc,profile,shenv,shrc}; do [ -e $i ] && mv $i $i.backup; done

# install prezto
printf '\033[0;34m%s\033[0m\n' "Cloning prezto..."
rm -rf $HOME/.zprezto
git clone --recursive git://github.com/kepbod/prezto.git $HOME/.zprezto
for i in $HOME/.zprezto/runcoms/z{login,logout,preztorc,profile,shenv}; do
    ln -s $i ${i/zprezto\/runcoms\//}
done
cp $HOME/.zprezto/runcoms/zshrc $HOME/.zshrc

# change default shell to zsh
chsh -s /bin/zsh || warn "Failed to change default shell. Please change it manually!"

printf '\033[0;34m%s\033[0m\n' "prezto has been installed. Please open a new zsh terminal window or tab to enjoy it!"

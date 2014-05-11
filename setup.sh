#!/usr/bin/env bash

help() {
    echo "setup.sh -- setup ivim"
    echo "Usage: setup.sh -i/-n"
    echo "-i -- install ivim"
    echo "-n -- update ivim"
    exit 0
}

color_print() {
    printf '\033[0;31m%s\033[0m\n' "$1"
}


warn()
{
    printf color_print "$1" >&2
}

die()
{
    warn "$1"
    exit 1
}

logo() {
    printf color_print "Thanks for installing prezto!"
    printf color_print "                     _        "
    printf color_print "                    | |       "
    printf color_print "  _ __  _ __ ___ ___| |_ ___  "
    printf color_print " | '_ \| '__/ _ \_  / __/ _ \ "
    printf color_print " | |_) | | |  __// /| || (_) |"
    printf color_print " | .__/|_|  \___/___|\__\___/ "
    printf color_print " | |                          "
    printf color_print " |_|                          "
}

require() {
    printf color_print "Checking requirements for prezto..."
    printf color_print "Checking if zsh exists..."
    which zsh || die "No zsh installed!\nPlease install zsh from http://http://www.zsh.org/"
    printf color_print "Checking if git exists..."
    which git || die "No git installed!\nPlease install git from http://git-scm.com/downloads/"
}

backup() {
    printf color_print "Backing up current zsh config..."
    for i in $HOME/.z{login,logout,preztorc,profile,shenv,shrc}; do [ -e $i ] && mv $i $i.backup; done
}

install() {
    printf color_print "Cloning prezto..."
    rm -rf $HOME/.zprezto
    git clone --recursive git://github.com/kepbod/prezto.git $HOME/.zprezto
    for i in $HOME/.zprezto/runcoms/z{login,logout,preztorc,profile,shenv}; do
        ln -s $i ${i/zprezto\/runcoms\//}
    done
    cp $HOME/.zprezto/runcoms/zshrc $HOME/.zshrc
    chsh -s /bin/zsh || warn "Failed to change default shell. Please change it manually!"
    printf color_print "prezto has been installed. Please open a new zsh terminal window or tab to enjoy it!"
}

update() {
    color_print "updating prezto..."
    git pull && git submodule update --init --recursive
}

if [ $# -ne 1 ]; then
    help
fi

while getopts ":in" opts; do
    case $opts in
        i)
            logo
            require
            backup
            install
            ;;
        n)
            update
            ;;
        :)
            help;;
        ?)
            help;;
    esac
done

#!/bin/sh

DOTFILES=$HOME/dotfiles
REPOSITORY=https://github.com/akijoey

help() {
    echo 'Usage: install.sh [OPTION]...'
    echo
    echo 'Options:'
    echo '  -p, setup the password of user'
    echo '  -d, delete the password of user'
    echo '  -h, display this help and exit'
    exit
}

while getopts 'hdp:' OPT; do
    case $OPT in
        p) echo $(whoami):$OPTARG | chpasswd ;;
        d) passwd -d $(whoami) ;;
        h) help ;;
        ?) help ;;
    esac
done

main() {
    apt update
    apt install -y \
        net-tools curl wget git subversion \
        apt-transport-https ca-certificates \
        software-properties-common \
        zsh tmux vim emacs \
        openssh-server \
        htop mc \

    # apply dotfiles
    wget -P /etc -N $REPOSITORY/akijoey/raw/main/motd
    if [ ! -d $DOTFILES ]; then
        git clone --depth=1 $REPOSITORY/dotfiles $DOTFILES
    fi
    cp -rf $DOTFILES/.[!.]* $HOME
    
    # source zsh
    chsh -s $(which zsh) $(whoami)
    [ -f $HOME/.zshrc ] && zsh -i $HOME/.zshrc

    # ssh server
    [ -f /etc/ssh/sshd_config ] && sed -i \
        -e 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' \
        -e 's/#PermitEmptyPasswords no/PermitEmptyPasswords yes/' \
        -e 's/#ClientAliveInterval 0/ClientAliveInterval 30/' \
        -e 's/#ClientAliveCountMax 3/ClientAliveCountMax 86400/' \
        /etc/ssh/sshd_config

    # program
    curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
    apt install -y \
        gcc g++ gdb cmake \
        python3 python3-pip \
        ruby-full \
        default-jdk \
        nodejs

    rm -rf $DOTFILES
    echo 'Install successed.'
    exit
}

main

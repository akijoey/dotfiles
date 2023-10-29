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
    apt-get update
    apt-get install -y \
        apt-transport-https ca-certificates \
        software-properties-common \
        build-essential net-tools gnupg \
        curl wget git subversion zsh tmux vim emacs \
        silversearcher-ag jq htop mc \
        openssh-server

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

    # setup program
    curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
    apt-get install -y \
        llvm lldb clang cmake \
        python3 python3-pip \
        default-jdk maven \
        php composer \
        ruby-full \
        rust-all \
        golang \
        nodejs
    npm install -g typescript
    
    # install lsp
    apt-get install -y clangd
    npm install -g \
        vscode-langservers-extracted \
        typescript-language-server \
        @volar/vue-language-server \
        dockerfile-language-server-nodejs \
        vim-language-server \
        bash-language-server \
        unified-language-server \
        yaml-language-server \
        intelephense
    pip install python-lsp-server \
        cmake-language-server \
        nginx-language-server
    go install golang.org/x/tools/gopls@latest
    gem install solargraph

    # init emacs
    emacs --batch -l $HOME/.emacs.d/init.el

    rm -rf $DOTFILES
    echo 'Install successed.'
    exit
}

main

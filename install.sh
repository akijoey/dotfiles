#!/bin/sh

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
        apt-transport-https ca-certificates software-properties-common \
        build-essential net-tools iputils-ping dnsutils gnupg man-db \
        curl wget rsync tree git subversion zsh tmux emacs vim \
        openssh-server

    # apply dotfiles
    PROFILE_REPOSITORY=https://github.com/akijoey/akijoey
    DOTFILES_REPOSITORY=https://github.com/akijoey/dotfiles
    DOTFILES=$HOME/dotfiles

    wget -P /etc -N $PROFILE_REPOSITORY/raw/main/motd
    if [ ! -d $DOTFILES ]; then
        git clone --depth=1 $DOTFILES_REPOSITORY $DOTFILES
    fi

    cp -rf $DOTFILES/.[!.]* $HOME
    rm -rf $DOTFILES
    
    # source zsh
    chsh -s $(which zsh) $(whoami)
    [ -f $HOME/.zshenv ] && . $HOME/.zshenv
    [ -f $HOME/.zshrc ] && zsh -i $HOME/.zshrc

    # ssh server
    [ -f /etc/ssh/sshd_config ] && sed -i \
        -e 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' \
        -e 's/#PermitEmptyPasswords no/PermitEmptyPasswords yes/' \
        -e 's/#ClientAliveInterval 0/ClientAliveInterval 30/' \
        -e 's/#ClientAliveCountMax 3/ClientAliveCountMax 86400/' \
        /etc/ssh/sshd_config

    # setup program
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    apt-get install -y \
        llvm lldb clang cmake \
        python3-full python3-pip pipx \
        default-jdk maven \
        php composer \
        nodejs npm \
        ruby-full \
        rust-all \
        golang
    npm install -g corepack typescript solc
    pipx ensurepath
    
    # install lsp
    apt-get install -y clangd
    pipx install python-lsp-server
    pipx install cmake-language-server
    pipx install nginx-language-server
    npm install -g \
        vscode-langservers-extracted \
        typescript-language-server \
        bash-language-server \
        vim-language-server \
        unified-language-server \
        yaml-language-server \
        graphql-language-service-cli \
        dockerfile-language-server-nodejs \
        @nomicfoundation/solidity-language-server \
        @vue/language-server \
        intelephense
    composer global require felixfbecker/language-server
    go install golang.org/x/tools/gopls@latest
    gem install solargraph
    cargo install -f ra_ap_rust-analyzer

    # modern unix
    apt-get install -y \
        fzf fd-find duf ripgrep silversearcher-ag \
        bat jq htop mc redis-tools
    pipx install httpie
    npm install -g tldr gtop
    cargo install git-delta eza procs gping

    # ensure bin home
    if [ ! -d $XDG_BIN_HOME ]; then
        mkdir -p $XDG_BIN_HOME
    fi

    # link fd
    if [ ! -f $XDG_BIN_HOME/fd ]; then
        ln -s $(which fdfind) $XDG_BIN_HOME/fd
    fi

    # link bat
    if [ ! -f $XDG_BIN_HOME/bat ]; then
        ln -s $(which batcat) $XDG_BIN_HOME/bat
    fi

    # init tmux
    if [ -f $HOME/.tmux.conf ]; then
        tmux new-session -d
        tmux source $HOME/.tmux.conf
        tmux kill-session
    fi

    # init emacs
    emacs --batch -l $HOME/.emacs.d/init.el

    echo 'Install successed.'
    exit
}

main

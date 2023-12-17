# zsh env

export LANG=en_US.UTF-8
export TERM=xterm-256color
export EDITOR=emacs
export VISUAL=$EDITOR

# xdg
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}

export XDG_BIN_HOME=${XDG_BIN_HOME:-$HOME/.local/bin}
export PATH=$XDG_BIN_HOME:$PATH

# man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# node
export PATH=./node_modules/.bin:$PATH

# rust
export PATH=$HOME/.cargo/bin:$PATH

# golang
export PATH=$(go env GOPATH)/bin:$PATH

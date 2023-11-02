# zsh env

export LANG=en_US.utf8
export TERM=xterm-256color
export EDITOR=emacs

# node
export PATH=./node_modules/.bin:$PATH

# rust
export PATH=$HOME/.cargo/bin:$PATH

# golang
export PATH=$(go env GOPATH)/bin:$PATH

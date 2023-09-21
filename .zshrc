# zsh configuration

XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}

# instant prompt
TRANSIENT_PROMPT_CACHE=$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh
[[ -r $TRANSIENT_PROMPT_CACHE ]] && source $TRANSIENT_PROMPT_CACHE

# install zinit
ZINIT_HOME=$XDG_DATA_HOME/zinit/bin
ZSH_CONFIG=$XDG_CONFIG_HOME/zsh

if [[ ! -f $ZINIT_HOME/zinit.zsh ]]; then
    mkdir -p $ZINIT_HOME
    git clone --depth=1 https://github.com/zdharma-continuum/zinit $ZINIT_HOME
fi

source $ZINIT_HOME/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# annexes
zinit light-mode depth"1" for \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl

# omz
zinit for \
    OMZL::correction.zsh \
    OMZL::directories.zsh \
    OMZL::history.zsh \
    OMZL::key-bindings.zsh \
    OMZL::theme-and-appearance.zsh \
    OMZP::common-aliases

zinit wait lucid for \
    OMZP::colored-man-pages \
    OMZP::cp \
    OMZP::extract \
    OMZP::fancy-ctrl-z \
    OMZP::git \
    OMZP::sudo

# completion
zinit wait lucid depth"1" for \
    atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
    blockf \
    zsh-users/zsh-completions \
    atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

zinit wait lucid light-mode depth"1" for \
    zsh-users/zsh-history-substring-search \
    hlissner/zsh-autopair \
    agkozak/zsh-z

# theme
zinit ice depth"1"
zinit light romkatv/powerlevel10k

THEME_CONFIG=$ZSH_CONFIG/p10k.zsh
[[ -f $THEME_CONFIG ]] && source $THEME_CONFIG

# gnupg
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$TTY
gpg-connect-agent updatestartuptty /bye >/dev/null

# alias
alias ec="emacsclient -ta ''"

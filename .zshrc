# zsh configuration

# instant prompt
TRANSIENT_PROMPT_CACHE=$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh
[[ -r $TRANSIENT_PROMPT_CACHE ]] && source $TRANSIENT_PROMPT_CACHE

# install zinit
ZINIT_REPOSITORY=https://github.com/zdharma-continuum/zinit
ZINIT_HOME=$XDG_DATA_HOME/zinit/bin
ZSH_CONFIG=$XDG_CONFIG_HOME/zsh

if [[ ! -f $ZINIT_HOME/zinit.zsh ]]; then
    mkdir -p $ZINIT_HOME
    git clone --depth=1 $ZINIT_REPOSITORY $ZINIT_HOME
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

# fzf
zinit ice wait lucid depth"1" atload"zicompinit; zicdreplay" blockf
zinit light Aloxaf/fzf-tab

zinit ice wait lucid depth"1"
zinit light joshskidmore/zsh-fzf-history-search

FZF_CONFIG=$ZSH_CONFIG/fzf.zsh
[[ -f $FZF_CONFIG ]] && source $FZF_CONFIG

# p10k
zinit ice depth"1"
zinit light romkatv/powerlevel10k

P10K_CONFIG=$ZSH_CONFIG/p10k.zsh
[[ -f $P10K_CONFIG ]] && source $P10K_CONFIG

# gpg
GPG_CONFIG=$ZSH_CONFIG/gpg.zsh
[[ -f $GPG_CONFIG ]] && source $GPG_CONFIG

# alias
alias ec="emacsclient -ta ''"

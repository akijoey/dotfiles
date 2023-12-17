# fzf config

export FZF_DEFAULT_COMMAND='fd --follow --type file || find . -follow -type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --ansi --cycle --layout=reverse --border'

# basic
zstyle ':fzf-tab:*' fzf-pad 4
zstyle ':fzf-tab:*' switch-group ',' '.'

# completion
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:complete:*:options' sort false
zstyle ':completion:*:git-checkout:*' sort false

# preview
zstyle ':fzf-tab:complete:(cd|ls|eza|bat|cat|emacs|nano|vi|vim):*' \
    fzf-preview 'eza -1 --color=always $realpath || ls -1 --color=always $realpath'
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
    fzf-preview 'echo ${(P)word}'
zstyle ':fzf-tab:complete:systemctl-*:*' \
    fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

zstyle ':fzf-tab:complete:git-(add|diff|restore):*' \
    fzf-preview 'git diff $word | delta'
zstyle ':fzf-tab:complete:git-(log|checkout):*' \
    fzf-preview 'git log --color=always $word'
zstyle ':fzf-tab:complete:git-show:*' \
    fzf-preview 'git show --color=always $word | delta'
zstyle ':fzf-tab:complete:git-help:*' \
    fzf-preview 'git help $word | bat -plman --color=always'

zstyle ':fzf-tab:complete:(\\|)run-help:*' \
    fzf-preview 'run-help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:(\\|*/|)man:*' \
    fzf-preview 'man $word | bat -plman --color=always'

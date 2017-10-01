if [ -z "$TMUX" ]; then
  tmux a || tmux new
fi

export TERM=xterm-256color

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^B' beginning-of-line
bindkey '^E' end-of-line
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/duythinht/.zshrc'

zstyle ':completion:*' menu select
zmodload zsh/complist

# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

autoload -Uz compinit colors && colors
fpath+=~/.zfunc
compinit
# End of lines added by compinstall

# Enable prompt themes
autoload -U promptinit
promptinit
[ -f ~/.zsh.theme ] && source ~/.zsh.theme
# Fix ls colors
export LSCOLORS="gxfxcxdxbxegedabagacad"
export LS_COLORS='di=0;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
# End of prompt theme

# Run commands alias
[ -f ~/.alias ] && while read line; do eval "alias $line"; done < ~/.alias
[ -f ~/.zaddrc ] && source ~/.zaddrc

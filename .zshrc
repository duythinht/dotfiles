if [ -z "$TMUX" ]; then
  tmux a || tmux new
fi

if [ -x "$(command -v nvim)" ]; then
  export EDITOR=nvim
else
  export EDITOR=vim
fi

export TERM=xterm-256color

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -v
# use jj to enter vim cmd mode
bindkey jj vi-cmd-mode
export KEYTIMEOUT=20

# ctrl + to get old command
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
[ -f ~/.zshrc.theme ] && source ~/.zshrc.theme
# Fix ls colors

# Run commands alias
case $(uname) in
Linux)
  [ -f ~/.zshrc.linux ] && source ~/.zshrc.linux
  [ -f ~/.zshrc.alias.linux ] && while read line; do eval "alias $line"; done < ~/.zshrc.alias.linux
  ;;
Darwin)
  [ -f ~/.zshrc.osx ] && source ~/.zshrc.osx
  [ -f ~/.zshrc.alias.osx ] && while read line; do eval "alias $line"; done < ~/.zshrc.alias.osx
  ;;
esac

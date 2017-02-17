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

autoload -Uz compinit colors && colors
fpath+=~/.zfunc
compinit
# End of lines added by compinstall

# Enable prompt themes
autoload -U promptinit
promptinit
PROMPT="[%F{29}%1d%f%b]$ "
[ -f ~/.zsh.theme ] && source ~/.zsh.theme
# Fix ls colors
export LSCOLORS="gxfxcxdxbxegedabagacad"
export LS_COLORS='di=0;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
# End of prompt theme

# Run commands alias
[ -f ~/.alias ] && while read line; do eval "alias $line"; done < ~/.alias
[ -f ~/.zaddrc ] && source ~/.zaddrc

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=$PATH:/usr/local/go/bin
source virtualenvwrapper.sh
export PATH=$PATH:/Users/duythinht/Applications/Postgres.app/Contents/Versions/9.5/bin

export GOPATH=$HOME/workspace/go
export PATH=$PATH:$GOPATH/bin/
export NOMAD_ADDR=http://10.60.3.231:4646/

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/duythinht/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"
# Run this command to configure your shell:
# eval $(docker-machine env)
export JAVA_HOME=/Library/Java/Home
eval $(thefuck --alias)
source /Users/duythinht/.gvm/scripts/gvm
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
source $HOME/.cargo/env
export RUST_SRC_PATH=$HOME/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src/

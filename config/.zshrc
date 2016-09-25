#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Workiva
if [[ $USER = "alextsankov" ]]; then
    source ~/.workivarc
fi

# History (http://superuser.com/questions/410965/command-history-in-zsh)
# append to the history file only after close.
setopt APPEND_HISTORY 
# share command history data
setopt share_history 

# vi keybindings
set -o vi

# Gostuff
# export GOPATH=$HOME/golang
export GOPATH=/usr/local/opt/go/libexec
# export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin

# Aliases
alias histgrep='history | grep'

#export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH="/Users/varo/.oh-my-zsh"

# ZSH_THEME="fino"
# ZSH_THEME="gnzh"
# ZSH_THEME="zhann"
# ZSH_THEME="gallois"
# ZSH_THEME="macovsky-ruby"
# ZSH_THEME="nebirhos"
# ZSH_THEME="superjarin"
ZSH_THEME="kennethreitz"
# ZSH_THEME="eastwood"

plugins=(
  archlinux
  git
  bundler
  rake
  rbenv
  ruby
  history-substring-search
  colored-man-pages
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
# To retrieve the history file every time history is called upon
setopt share_history

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

setopt GLOB_DOTS

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

#PS1='[\u@\h \W]\$ '

#set vim to disable ctrl-s
alias vim="stty -ixon && vim"

#rails 
alias r=rails

# TERM color
alias tmux="TERM=screen-256color-bce tmux"

#list
#alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -la'
alias l='ls'
alias l.="ls -A | egrep '^\.'"

#fix obvious typo's
alias cd..='cd ..'
alias pdw="pwd"

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#shutdown or reboot
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=100000
setopt autocd extendedglob
unsetopt beep
# activate vim mode
bindkey -v
# End of lines configured by zsh-newuser-install

# Hide username@hostname when logged in local machine 
prompt_context(){}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Add Homebrew's executable directory to the front of the PATH
#export PATH=/usr/local/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH

# set rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# disable homebrew auto update every time it is executed
export HOMEBREW_NO_AUTO_UPDATE=1

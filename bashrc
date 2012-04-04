# kuoney's bash settings #
##########################

# Return if shell is non-interactive
[ -z "$PS1" ] && return

# language - so gcc doesn't throw up weird characters !
export LANG="en_US.utf8"
export LC_ALL="en_US.utf8"

# Source global bashrc
[ -f /etc/bash.bashrc ] && . /etc/bash.bashrc

# Clever tab completion
[ -f /etc/bash_completion ] && . /etc/bash_completion

# Welcome message
date
[ -f /usr/games/fortune ] && /usr/games/fortune

# prompt, including git info
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[36m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

# aliases
alias vi='vim -X'
# highlight search term, skip directories. tty ensures the output behaves nicely
# with pipes
alias egrep='egrep --color=tty -d skip'
alias fgrep='fgrep --color=tty -d skip'
alias grep='grep --color=tty -d skip'

# editing
export EDITOR=vim	# use vim for errything!
set -o vi			# including the command line

# history control
export HISTSIZE=20000
shopt -s histappend

# colorful man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
# colorful files
alias ls='ls --color=tty'
alias ll='ls -l'
eval `dircolors -b`

# functions

# show mounts nicely aligned
function mountnice() {
    (echo "DEVICE PATH TYPE FLAGS" && mount | awk '$2=$4="";1') | column -t
}

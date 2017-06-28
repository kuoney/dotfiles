# kuoney's bash settings #
##########################

# Source global bashrc
[ -f /etc/bashrc ] && . /etc/bashrc
[ -f /etc/bash.bashrc ] && . /etc/bash.bashrc

# Return if shell is non-interactive
[ -z "$PS1" ] && return

# language - so gcc doesn't throw up weird characters !
export LANG="en_US.utf8"
export LC_ALL="en_US.utf8"

# Enable and use Redhat Software Collections
for dir in /opt/rh/*/
do
	[ -f ${dir}/enable ] && source ${dir}/enable
done

# Clever tab completion
[ -f /etc/bash_completion ] && . /etc/bash_completion

# Add git-prompt from the special collections
[ -f /opt/rh/git19/root/usr/share/git-core/contrib/completion/git-prompt.sh ] && \
	. /opt/rh/git19/root/usr/share/git-core/contrib/completion/git-prompt.sh

[ -f /opt/rh/git19/root/etc/bash_completion.d/git ] && \
	. /opt/rh/git19/root/etc/bash_completion.d/git

# Welcome message
date
# Show the weather
curl -s wttr.in/Raleigh | head -7
[ -f /usr/games/fortune ] && /usr/games/fortune

# prompt, including git info
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[36m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
export GIT_PS1_SHOWDIRTYSTATE=1

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
export HISTCONTROL=ignoreboth:erasedups
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
# From https://github.com/trapd00r/LS_COLORS/
eval $(dircolors -b $HOME/.dircolors)

# ltib aliases
alias scpr='./ltib -m prep -p'
alias scb='./ltib -m scbuild -p'
alias scd='./ltib -m scdeploy -p'

# xterm setup for putty
if [ "$TERM" = xterm ]
then
	export TERM=xterm-256color
fi

# functions

# show mounts nicely aligned
function mountnice() {
    (echo "DEVICE PATH TYPE FLAGS" && mount | awk '$2=$4="";1') | column -t
}

function scall() {
	echo "$@"
	scpr "$@" && scb "$@" && scd "$@"
}

function scbd() {
	scb "$@" && scd "$@"
}

[[ -e $HOME/.rvm/bin ]] && PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# ls fix for solarized dircolors. From
# http://michaelheap.com/getting-solarized-working-on-ubuntu/
if [ -x /usr/bin/dircolors ];
	then test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# add local bin to the PATH, usually for repo
if [ -d "${HOME}/bin" ];
then
	export PATH=${PATH}:${HOME}/bin
fi

if [ "$(hostname)" == "mvlrhel7" ]
then
	BBOT=/home/buildbot
	eval "$(${BBOT}/bin/bb/bin/bb init -)"
	source ${BBOT}/bin/git-subrepo/.rc
	export PATH=${PATH}:/home/buildbot/bin
fi

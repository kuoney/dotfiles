# kuoney's bash settings #
##########################

# Source global bashrc
[ -f /etc/bashrc ] && . /etc/bashrc
[ -f /etc/bash.bashrc ] && . /etc/bash.bashrc

# language - so gcc doesn't throw up weird characters !
export LANG="en_US.utf8"
export LC_ALL="en_US.utf8"

# Clever tab completion
[ -f /etc/bash_completion ] && . /etc/bash_completion

# Welcome message only if interactive
if [[ $- == *i* ]]; then
	# Welcome message
	date
	# Show the weather if we're on the Internet
	if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
		curl -s wttr.in/Raleigh+NC | head -7
	fi

	[ -f /usr/games/fortune ] && /usr/games/fortune
fi

# prompt, including git info
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[36m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
# Return if shell is non-interactive
# [ -z "$PS1" ] && return
export GIT_PS1_SHOWDIRTYSTATE=1
# Do not try to launch gnome-ssh-askpass when pushing commits
unset SSH_ASKPASS

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

# pathmunge to remove duplicates from PATH
pathmunge () {
	if ! echo $PATH | /bin/egrep -q "(^|:)$1($|:)" ; then
		if [ "$2" = "after" ] ; then
			PATH=$PATH:$1
		else
			PATH=$1:$PATH
		fi
	fi
}
export -f pathmunge

# ls fix for solarized dircolors. From
# http://michaelheap.com/getting-solarized-working-on-ubuntu/
#if [ -x /usr/bin/dircolors ];
#	then test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#fi

# add local bin to the PATH, usually for repo
if [ -d "${HOME}/bin" ];
then
	export PATH=${PATH}:${HOME}/bin
fi

command -v domainname > /dev/null 2>&1 && \
	[ -f ${HOME}/.dotfiles/host/$(domainname).sh ] && \
		.  ${HOME}/.dotfiles/host/$(domainname).sh

command -v hostname > /dev/null 2>&1 && \
	[ -f ${HOME}/.dotfiles/host/$(hostname).sh ] && \
		.  ${HOME}/.dotfiles/host/$(hostname).sh

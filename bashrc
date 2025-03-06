# kuoney's bash settings #
##########################

# non-interactive shells should return immediately.
[[ "$-" != *i* ]] && return

# Source global bashrc
[ -f /etc/bashrc ] && . /etc/bashrc
[ -f /etc/bash.bashrc ] && . /etc/bash.bashrc

# show mounts nicely aligned
function mountnice() {
    (echo "DEVICE PATH TYPE FLAGS" && mount | awk '$2=$4="";1') | column -t
}

if [ ! "$(uname)" == "Darwin" ]; then
	# language - so gcc doesn't throw up weird characters !
	export LANG="en_US.utf8"
	export LC_ALL="en_US.utf8"
fi

# Clever tab completion
[ -f /etc/bash_completion ] && . /etc/bash_completion

# Show the date and weather once a day if we're on the Internet
today=$(date +%-d)
last_login_date=$(lastlog -u $USER | tail -1 | tr -s ' ' | cut -f6 -d' ')

if [[ "$today" -ne "$last_login_date" ]]
then
	# Welcome message
	date
	if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
		curl -m 3 -s wttr.in/Raleigh+NC?0qF
	fi
fi

[ -f /usr/games/fortune ] && /usr/games/fortune
[ -f ~/.git-prompt.sh ] && source ~/.git-prompt.sh

# prompt, including git info
export PS1='\[\033[00m\]\u@\h\[\033[00m\]:\[\033[32m\][\D{%H:%M:%S}] \[\033[00m\]\[\033[36m\]\w\[\033[31m\]\[\033[00m\] $ '
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

# colorful svndiff
alias svndiff='svn diff | colordiff | less -RX'
alias svnstat='svn diff | grep Index'
alias hnddiff='hnd scm diff | colordiff | less -RX'
alias hndstat='hnd scm diff | grep Index'

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
# ls fix for solarized dircolors. From
# http://michaelheap.com/getting-solarized-working-on-ubuntu/
# but this seg-faults on gnome-shell on centos. So run this only if
# on ubuntu
if lsb_release -a 2> /dev/null | grep Ubuntu > /dev/null ; then
	if ! xhost >& /dev/null; then
		if [ -x /usr/bin/dircolors ];
			then test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
		fi
	fi
fi

# direxpand does not seem to work with bash 4.2
if ((BASH_VERSINFO[0] >= 4)) && ((BASH_VERSINFO[1] >= 2))
	then shopt -s direxpand
fi

command -v domainname > /dev/null 2>&1 && \
	[ -f ${HOME}/.dotfiles/host/$(domainname).sh ] && \
		.  ${HOME}/.dotfiles/host/$(domainname).sh

command -v hostname > /dev/null 2>&1 && \
	[ -f ${HOME}/.dotfiles/host/$(hostname).sh ] && \
		.  ${HOME}/.dotfiles/host/$(hostname).sh

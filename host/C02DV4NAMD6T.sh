# pathmunge to remove duplicates from PATH
pathmunge () {
	if ! echo $PATH | /usr/bin/egrep -q "(^|:)$1($|:)" ; then
		if [ "$2" = "after" ] ; then
			PATH=$PATH:$1
		else
			PATH=$1:$PATH
		fi
	fi
}
export -f pathmunge

pathshow() {
	echo "$PATH" | tr ':' '\n'
}

# --color=tty option doesn't work. I don't know if that's even
# required really.
unalias ls

# __git_ps1 doesn't yet work.
export PS1=

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
	GIT_PROMPT_THEME=Single_line_Solarized
	GIT_PROMPT_SHOW_UPSTREAM=0
	GIT_PROMPT_SHOW_UNTRACKED_FILES=no
	__GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
	source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
source /usr/local/etc/bash_completion.d/git-completion.bash

# Alternative to dircolors on Mac
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

pathmunge $PHOME/tools/bin before

# add precommit and hnd from wlan-utils
pathmunge /usr/local/opt/wlan-utils/bca/bin/ before

# For brew
pathmunge /usr/local/bin before
pathmunge $(brew --prefix)/opt/gawk/libexec/gnubin before
pathmunge $(brew --prefix python)/libexec/bin after

# for claude
pathmunge $HOME/.local/bin after

# For wlan-utils, 'hnd' command:
export GUB_MODE=ACCESS

# Artifactory setup
export PIP_INDEX_URL="$(python3 -m pip config get global.index-url)"
export HOMEBREW_PIP_INDEX_URL="$PIP_INDEX_URL"
export PHOME=/Volumes/Code
alias cdp='cd $PHOME'

# Set up fzf shell integration
eval "$(fzf --bash)"

# Initialize zoxide
eval "$(zoxide init bash)"

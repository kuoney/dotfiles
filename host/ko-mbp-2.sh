# --color=tty option doesn't work. I don't know if that's even
# required really.
unalias ls

# For MacPorts
# export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# For brew
export PATH="/usr/local/bin:$PATH"
# For my own utils
# export PATH="$PATH:/Volumes/Code/git/esdk-misc-utils"

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

PATH="/Users/ko889424/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/ko889424/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/ko889424/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/ko889424/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/ko889424/perl5"; export PERL_MM_OPT;

export PHOME=/Volumes/Code
alias cdp='cd $PHOME'
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

pathmunge $PHOME/git/esdk-misc-utils/bin before

# add precommit and hnd from wlan-utils
pathmunge /usr/local/opt/wlan-utils/bin/bca/bin/ before

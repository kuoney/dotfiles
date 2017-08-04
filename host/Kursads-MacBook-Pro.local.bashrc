# --color=tty option doesn't work. I don't know if that's even
# required really.
unalias ls

# __git_ps1 doesn't yet work.
export PS1=

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
	__GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
	source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
source /usr/local/etc/bash_completion.d/git-completion.bash

# Alternative to dircolors on Mac
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

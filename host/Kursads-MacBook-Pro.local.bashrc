unalias ls
export PS1=
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
	__GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
	source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
source /usr/local/etc/bash_completion.d/git-completion.bash

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

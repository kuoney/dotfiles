alias cdp='cd $PHOME'
alias cats='highlight -O ansi --force'

ackwl() {

	wltop=bcmdrivers/broadcom/net/wl
	wlimpl=$(find "$wltop" -maxdepth 2 -type d -name main -printf "%h\n")
	if [ -z "$wlimpl" ]; then
		echo "no active wlimpl"
	else
		ack "${@:1}" "$wlimpl"/main
	fi
}

ackdhd() {

	wltop=bcmdrivers/broadcom/net/wl
	wlimpl=$(find "$wltop" -maxdepth 2 -type d -name main -printf "%h\n")
	if [ -z "$wlimpl" ]; then
		echo "no active wlimpl"
	else
		ack "${@:1}" "$wlimpl"/sys
	fi
}

unset GIT_PS1_SHOWDIRTYSTATE
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_FETCH_REMOTE_STATUS=0
GIT_PROMPT_SHOW_UPSTREAM=0
GIT_PROMPT_SHOW_UNTRACKED_FILES=no
GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0
GIT_PROMPT_THEME=Single_line_Solarized
source ~/.bash-git-prompt/gitprompt.sh

[[ -f ~/.git-completion.bash ]] && source ~/.git-completion.bash

source ${PHOME}/git/esdk-misc-utils/build/esdk.sh

# override toolchain base to use the better ccache and stuff
export TOOLCHAIN_BASE=$PHOME/toolchains/newcached

[ -d ${PHOME}/bin ] &&			pathpurge ${PHOME}/bin && pathmunge ${PHOME}/bin before
[ -d ${PHOME}/install/bin ] &&		pathpurge ${PHOME}/install/bin &&   pathmunge ${PHOME}/install/bin
[ -d ${PHOME}/tools/bin ] &&		pathpurge ${PHOME}/tools/bin && pathmunge ${PHOME}/tools/bin before
[ -d /projects/hnd/tools/linux/bin/ ] &&	pathmunge /projects/hnd/tools/linux/bin/ after
export PAHOLEVER=1.22
export HTOPVER=2.2.0

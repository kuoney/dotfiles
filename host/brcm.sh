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

# Added by iiprep
pathmunge /projects/bca/tools/wbin after

# add bash completion for anvil. If absent, silently a no-op
eval "$(register-python-argcomplete anvil)"

pathmunge /projects/wcc_sw_gallery/repos/mob-scm-rb-reviewbot/scripts/ after

# reduce context
export LS_COLORS="di=00;38;5;33:ln=01;38;5;37:ex=01;38;5;64:or=48;5;235;38;5;160:ow=48;5;235;38;5;33:tw=48;5;64;38;5;230:st=48;5;33;38;5;230:so=01;38;5;136:pi=01;38;5;136:bd=01;38;5;244:cd=01;38;5;244"
# Unset exported shell functions from environment modules
unset -f module
unset -f _module_raw
unset -f switchml
unset -f scl
unset -f ml
unset MODULEPATH_modshare XDG_RUNTIME_DIR DBUS_SESSION_BUS_ADDRESS MODULEPATH XDG_DATA_DIRS GUESTFISH_RESTORE

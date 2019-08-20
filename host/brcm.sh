function setup_uboot() {

	GCC=crosstools-${1-aarch64}-gcc-${2-5.5}
	KERNEL=linux-${3-4.1}
	GLIBC=glibc-${4-2.26}
	BINUTILS=binutils-${5-2.28.1}

	export TOOLCHAIN_BASE=/opt/toolchains
	# optional to use other tools like objcopy
	pathmunge ${TOOLCHAIN_BASE}/${GCC}-${KERNEL}-${GLIBC}-${BINUTILS}/usr/bin/ after

	# optional, for building u-boot separately
	[[ "${1-aarch64}" == "aarch64" ]] && CC_PREFIX=buildroot-linux-gnu- || CC_PREFIX=buildroot-linux-gnueabi-
	export CROSS_COMPILE=${1-aarch64}-${CC_PREFIX}
}

# export these functions to be used in other scripts
export -f setup_uboot

alias cdp='cd $PHOME'

unset PS1
unset GIT_PS1_SHOWDIRTYSTATE
GIT_PROMPT_FETCH_REMOTE_STATUS=0
GIT_PROMPT_SHOW_UPSTREAM=0
GIT_PROMPT_SHOW_UNTRACKED_FILES=no
GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0
GIT_PROMPT_THEME=Single_line_Solarized
source ~/.bash-git-prompt/gitprompt.sh

[[ -f ~/.git-completion.bash ]] && source ~/.git-completion.bash

export BASH_ENV=$HOME/.bashrc
source ${PHOME}/git/esdk-misc-utils/build/esdk.sh

[ -d ${PHOME}/bin ] &&			pathmunge ${PHOME}/bin before
[ -d ${PHOME}/install/bin ] &&		pathmunge ${PHOME}/install/bin
[ -d ${PHOME}/tools/bin ] &&		pathmunge $PHOME/tools/bin before

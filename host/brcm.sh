function setup_environment() {

	GCC=crosstools-${1-aarch64}-gcc-${2-5.5}
	KERNEL=linux-${3-4.1}
	GLIBC=glibc-${4-2.26}
	BINUTILS=binutils-${5-2.28.1}

	export TOOLCHAIN_BASE=/projects/${ORG}/tools/linux/BCG
	export LD_LIBRARY_PATH=${TOOLCHAIN_BASE}/${GCC}-${KERNEL}-${GLIBC}-${BINUTILS}/usr/lib
	# optional to use other tools like objcopy
	pathmunge ${TOOLCHAIN_BASE}/${GCC}-${KERNEL}-${GLIBC}-${BINUTILS}/usr/bin/ after

	# optional, for building u-boot separately
	[[ "${1-aarch64}" == "aarch64" ]] && CC_PREFIX=buildroot-linux-gnu- || CC_PREFIX=buildroot-linux-gnueabi-
	export CROSS_COMPILE=${1-aarch64}-${CC_PREFIX}
}

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

function populate_impl() {
	hnd -V scm co --direct -t ${1-KUDU_BRANCH_17_10} -d bcmdrivers/broadcom/net/wl/impl${2-51} linux-4.1.0-router
}

function lsfmake() {
	/tools/bin/bsub -q ${QUEUE} -R osmajor='RHEL6 span[hosts=1]' -sp 120 -n ${jobs-8} -Is "make $@ BRCM_MAX_JOBS=${jobs-8}"
}

function pmake() {
	jobs=$1
	if  [[ "$jobs" -ge 0 ]]; then
		shift
		make "$@" BRCM_MAX_JOBS=${jobs}
	else
		make "$@"
	fi
}

# export these functions to be used in other scripts
export -f setup_environment
export -f setup_uboot
export -f populate_impl
export -f lsfmake

alias cdp='cd $PHOME'
export SUBVERSIONVER=1.8.14
export P4VER=2018.2

[ -d /tools/bin ] &&			pathmunge /tools/bin
[ -d ${PHOME}/bin ] &&			pathmunge ${PHOME}/bin
[ -d ${PHOME}/install/bin ] &&		pathmunge ${PHOME}/install/bin
[ -d /tools/nwsoft/bin ] &&		pathmunge /tools/nwsoft/bin after
[ -d /projects/${ORG}/tools/bin ] &&	pathmunge /projects/${ORG}/tools/bin after
[ -d /projects/${ORG}/tools/linux/bin/ ] && pathmunge /projects/${ORG}/tools/linux/bin/ after
[ -d ${PHOME}/tools/bin ] &&		pathmunge $PHOME/tools/bin before
[ -d ${PHOME}/git/esdk-misc-utils ] &&	pathmunge $PHOME/git/esdk-misc-utils after

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

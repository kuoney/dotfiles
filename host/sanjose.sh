function setup-environment() {

	if [ "$#" -lt 2 ]; then
		echo "${FUNCNAME[0]} arch glibc_ver (arch=arm, aarch64; glibc_ver=22, 24)"
		return 0
	fi

	arch=${1}
	glibc_ver=${2}

	TC_BASE_BASE=/projects/bca/tools/linux
	GCC=crosstools-${arch}-gcc-5.3
	KERNEL=linux-4.1
	GLIBC=glibc-2.${glibc_ver}
	BINUTILS=binutils-2.25

	export TOOLCHAIN_BASE=${TC_BASE_BASE}/BCG
	export LD_LIBRARY_PATH=${TOOLCHAIN_BASE}/${GCC}-${KERNEL}-${GLIBC}-${BINUTILS}/usr/lib:$LD_LIBRARY_PATH
	export PATH=${PHOME}/bin:${TC_BASE_BASE}/hndtools-armeabi-2013.11/bin:$PATH
}

function setup-u-boot() {

	if [ "$#" -lt 2 ]; then
		echo "${FUNCNAME[0]} arch glibc_ver (arch=arm, aarch64; glibc_ver=22, 24)"
		return 0
	fi

	arch=${1}
	glibc_ver=${2}

	TC_BASE_BASE=/projects/bca/tools/linux
	GCC=crosstools-${arch}-gcc-5.3
	KERNEL=linux-4.1
	GLIBC=glibc-2.${glibc_ver}
	BINUTILS=binutils-2.25

	export ARCH=arm64
	export TOOLCHAIN_BASE=${TC_BASE_BASE}/BCG
	export LD_LIBRARY_PATH=${TOOLCHAIN_BASE}/${GCC}-${KERNEL}-${GLIBC}-${BINUTILS}/usr/lib:$LD_LIBRARY_PATH
	export PATH=${PHOME}/bin:${TC_BASE_BASE}/hndtools-armeabi-2013.11/bin:$PATH
	export CROSS_COMPILE=${TOOLCHAIN_BASE}/${GCC}-${KERNEL}-${GLIBC}-${BINUTILS}/usr/bin/aarch64-buildroot-linux-gnu-
}

function populate-impl51() {
	cd bcmdrivers/broadcom/net/wl/impl51 &&
	hnd -V scm co -t KUDU_BRANCH_17_10 -d . linux-4.1.0-router-dhdap &&
	cd ../../../../../
}

# Project home
export PHOME='/projects/bcawlan_ext02/work/ko889424'
alias cdp='cd $PHOME'

export PATH=${PHOME}/install/bin:/tools/bin:/tools/nwsoft/bin:/projects/bca/tools/bin:${PATH}:${PHOME}/bin

unset PS1
unset GIT_PS1_SHOWDIRTYSTATE
GIT_PROMPT_FETCH_REMOTE_STATUS=0
GIT_PROMPT_SHOW_UPSTREAM=0
GIT_PROMPT_SHOW_UNTRACKED_FILES=no
GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0
GIT_PROMPT_THEME=Single_line_Solarized
source ~/.bash-git-prompt/gitprompt.sh

[[ -f ~/.git-completion.bash ]] && source ~/.git-completion.bash

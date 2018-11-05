function setup_environment() {

	arch=${1-aarch64}
	gcc_ver=${2-5.5}
	glibc_ver=${3-2.26}
	binutils_ver=${4-2.28.1}

	TC_BASE_BASE=/projects/${ORG}/tools/linux
	GCC=crosstools-${arch}-gcc-${gcc_ver}
	KERNEL=linux-4.1
	GLIBC=glibc-${glibc_ver}
	BINUTILS=binutils-${binutils_ver}

	export TOOLCHAIN_BASE=${TC_BASE_BASE}/BCG
	export LD_LIBRARY_PATH=${TOOLCHAIN_BASE}/${GCC}-${KERNEL}-${GLIBC}-${BINUTILS}/usr/lib
	pathmunge ${TC_BASE_BASE}/hndtools-armeabi-2013.11/bin after
	# optional
	pathmunge ${TOOLCHAIN_BASE}/${GCC}-${KERNEL}-${GLIBC}-${BINUTILS}/usr/bin/ after

	# u-boot needs CROSS_COMPILE
	CC_PREFIX=buildroot-linux-gnueabi-

	if [ "${arch}"x = "aarch64x" ]; then
		CC_PREFIX=buildroot-linux-gnu-
	fi
	export CROSS_COMPILE=${TOOLCHAIN_BASE}/${GCC}-${KERNEL}-${GLIBC}-${BINUTILS}/usr/bin/${arch}-${CC_PREFIX}
}

function populate_impl51() {
	tag=${1-KUDU_BRANCH_17_10}
	cd bcmdrivers/broadcom/net/wl/impl51 &&
	hnd -V scm co -t ${tag} -d . linux-4.1.0-router &&
	cd ../../../../../
}

function ksub() {
	jobs=${jobs=8}
	/tools/bin/bsub -q ${QUEUE} -R osmajor='RHEL6 span[hosts=1]' -sp 120 -n ${jobs} -Is "$@"
}

# export these functions to be used in other scripts
export -f setup_environment
export -f populate_impl51
export -f ksub

alias cdp='cd $PHOME'
export SUBVERSIONVER=1.8.14

[ -d /tools/bin ] &&			pathmunge /tools/bin
[ -d ${PHOME}/bin ] &&			pathmunge ${PHOME}/bin
[ -d ${PHOME}/install/bin ] &&		pathmunge ${PHOME}/install/bin
[ -d /tools/nwsoft/bin ] &&		pathmunge /tools/nwsoft/bin after
[ -d /projects/${ORG}/tools/bin ] &&	pathmunge /projects/${ORG}/tools/bin after

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

function setup-environment() {
	export ARCH=arm64
	export TOOLCHAIN_ROOT=/projects/hnd/tools/linux/
	export PATH=${TOOLCHAIN_ROOT}/hndtools-armeabi-2011.09/bin:${PATH}
	export LD_LIBRARY_PATH=${TOOLCHAIN_ROOT}/BCG/crosstools-aarch64-gcc-5.3-linux-4.1-glibc-2.22-binutils-2.25/usr/lib:${LD_LIBRARY_PATH}
	export CROSS_COMPILE=${TOOLCHAIN_ROOT}/BCG/crosstools-aarch64-gcc-5.3-linux-4.1-glibc-2.22-binutils-2.25/usr/bin/aarch64-buildroot-linux-gnu-
}

export PATH=/tools/bin:/tools/nwsoft/bin:/projects/hnd/tools/bin:${PATH}

GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_THEME=Single_line_Solarized
source ~/.bash-git-prompt/gitprompt.sh

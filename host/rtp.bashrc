# the git installation is severely lacking on this host
function parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function setup-environment() {
	export ARCH=arm64
	export TOOLCHAIN_ROOT=/projects/hnd/tools/linux/
	export PATH=${TOOLCHAIN_ROOT}/hndtools-armeabi-2011.09/bin:${PATH}
	export LD_LIBRARY_PATH=${TOOLCHAIN_ROOT}/BCG/crosstools-aarch64-gcc-5.3-linux-4.1-glibc-2.22-binutils-2.25/usr/lib:${LD_LIBRARY_PATH}
	export CROSS_COMPILE=${TOOLCHAIN_ROOT}/BCG/crosstools-aarch64-gcc-5.3-linux-4.1-glibc-2.22-binutils-2.25/usr/bin/aarch64-buildroot-linux-gnu-
}

export PATH=/tools/bin:/tools/nwsoft/bin:/projects/hnd/tools/bin:${PATH}
# __git_ps1 doesn't exist on this machine so use the custom one
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[36m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '

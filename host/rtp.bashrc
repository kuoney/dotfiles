function setup-environment() {
	export ARCH=arm64
	export TOOLCHAIN_ROOT=/projects/hnd/tools/linux/
	export PATH=${TOOLCHAIN_ROOT}/hndtools-armeabi-2011.09/bin:${PATH}
	export LD_LIBRARY_PATH=${TOOLCHAIN_ROOT}/BCG/crosstools-aarch64-gcc-5.3-linux-4.1-glibc-2.22-binutils-2.25/usr/lib:${LD_LIBRARY_PATH}
	export CROSS_COMPILE=${TOOLCHAIN_ROOT}/BCG/crosstools-aarch64-gcc-5.3-linux-4.1-glibc-2.22-binutils-2.25/usr/bin/aarch64-buildroot-linux-gnu-
}

export PATH=/tools/bin:/tools/nwsoft/bin:/projects/hnd/tools/bin:${PATH}

GIT_PROMPT_THEME=Single_line_Solarized
GIT_PROMPT_SHOW_UPSTREAM=0
GIT_PROMPT_SHOW_UNTRACKED_FILES=no
source ~/.bash-git-prompt/gitprompt.sh

GIT_CONTRIB_DIR=/projects/bca_ent_tools/contrib/git
GIT_CONTRIB_FILES='git-completion.bash'

for file in $GIT_CONTRIB_FILES
do
	[[ -r $GIT_CONTRIB_DIR/$file ]] && source $GIT_CONTRIB_DIR/$file
done

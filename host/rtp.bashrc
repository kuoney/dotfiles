function setup-environment() {
	export LD_LIBRARY_PATH=/projects/hnd/tools/linux/BCG/crosstools-arm-gcc-5.3-linux-4.1-glibc-2.22-binutils-2.25/usr/lib:$LD_LIBRARY_PATH
	export TOOLCHAIN_BASE=/projects/hnd/tools/linux/BCG
	export PATH=/projects/hnd/tools/linux/hndtools-armeabi-2013.11/bin:$PATH
}

alias cdp='cd /projects/bca_ent_wlan_ext02/esdk_wksp/ko889424'

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

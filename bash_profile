# .bashrc is not sourced when logged in via ssh. Need to use this file.
#
# non-interactive shells should return immediately.
[[ "$-" != *i* ]] && return

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

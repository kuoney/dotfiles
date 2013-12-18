# .bashrc is not sourced when logged in via ssh. Need to use this file.
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

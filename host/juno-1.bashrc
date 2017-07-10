if [ "$(hostname)" == "juno-1" ]
then
	eval "$(${HOME}/tmp/bb/bin/bb init -)"
	source ${HOME}/tmp/git-subrepo/.rc
fi

[ -f /etc/bash.bashrc ] && . /etc/bash.bashrc

# Enable and use Redhat Software Collections
for dir in /opt/rh/*/
do
	[ -f ${dir}/enable ] && source ${dir}/enable
done

# Add git-prompt from the special collections
[ -f /opt/rh/git19/root/usr/share/git-core/contrib/completion/git-prompt.sh ] && \
	. /opt/rh/git19/root/usr/share/git-core/contrib/completion/git-prompt.sh

[ -f /opt/rh/git19/root/etc/bash_completion.d/git ] && \
	. /opt/rh/git19/root/etc/bash_completion.d/git

BBOT=/home/buildbot
eval "$(${BBOT}/bin/bb/bin/bb init -)"
source ${BBOT}/bin/git-subrepo/.rc
export PATH=${PATH}:/home/buildbot/bin

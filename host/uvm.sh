export ORG=hnd
export PHOME="${HOME}/code/"

source $HOME/.dotfiles/host/brcm.sh

# we have ccache for host enabled on this host so turn it
# on for everyone.
# pathmunge /usr/lib/ccache/ before

# for hnd, precommit etc. tools
pathmunge /opt/bca/bin/ after
pathmunge /home/ko889424/code/git/esdk-misc-utils after
export TOOLCHAIN_BASE=/opt/cached

# BBSX requires JAVA_HOME to be set
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

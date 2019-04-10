export ORG=hnd
export PHOME="${HOME}/code/work"

source $HOME/.dotfiles/host/brcm.sh

# we have ccache for host enabled on this host so turn it
# on for everyone.
pathmunge /usr/lib/ccache/ before

# for hnd, precommit etc. tools
pathmunge /opt/bca/bin/ after

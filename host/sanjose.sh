export ORG=bca
export QUEUE=sj-bcasw

if [ -d /auto/workspace_02/ko889424/ ]; then
	export PHOME='/auto/workspace_02/ko889424'
else
	export PHOME='/projects/bcawlan_ext02/work/ko889424'
fi

# Make us think we're in ET since git uses localtime-tz pairing
# for commits. This is fine when we're just using git but when
# we use git-p4 from multiple locations, it causes the hashes
# for the same commits to be different. Being in the same TZ means
# we can have the same hash no matter where we run git p4 rebase
export TZ="/usr/share/zoneinfo/America/New_York"

# Use the cached toolchain and set the cache dir
export TOOLCHAIN_BASE=/opt/toolchains/newcached
export CCACHE_DIR=/auto/workspace_02/ko889424/ccache
# make 4.2.1 is broken
export MAKEVER=3.82

source $HOME/.dotfiles/host/brcm.sh

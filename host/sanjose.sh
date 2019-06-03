export ORG=bca
export QUEUE=sj-bcasw

if [ -d /auto/workspace_02/ko889424/ ]; then
	export PHOME='/auto/workspace_02/ko889424/'
else
	export PHOME='/projects/bcawlan_ext02/work/ko889424'
fi

source $HOME/.dotfiles/host/brcm.sh

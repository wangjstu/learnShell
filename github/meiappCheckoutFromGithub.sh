#!/bin/bash

#check user is not root
[ "$(id -u)" == "0" ] && echo "Error: You must not be root to run this script." && exit 1

function RUNCMD() {
	echo "[$(date +'%Y-%m-%d %H:%M:%S:%N')][notice] $*"
	echo -e "\033[41;33m ####################EVAL LOG####################### \033[0m"
	eval $@
	echo -e "\033[41;33m ####################EVAL LOG####################### \033[0m"
}

function NOTICE() {
	echo >/dev/null && echo "[$(date +'%Y-%m-%d %H:%M:%S:%N')][notice] $*"
}

function ERROR() {
	echo >/dev/null && echo -e "\033[41;30m [$(date +'%Y-%m-%d %H:%M:%S:%N')][error] $* \033[0m"
}


function Git_Pull() {
	RUNCMD "git pull origin master"
}

function Git_Push() {
	if [ $# -ne 2 ]; then
		ERROR "Usage: sh meiappCheckoutFromGithub.sh Git_Push commit_comments!"
		exit 1;
	else
		RUNCMD "git pull && git add --all && git commit -m \"$2\" && git push origin master"
	fi	
}

NOTICE "----------------------BEGIND-----------------"

case $# in
	1)
	{
		NOTICE "run in Git_Pull"
		Git_Pull
	}	
	;;
	2)
	{
		NOTICE "run in Git_Push"
		Git_Push "$@"
	}
	;;
	*)
	{
		NOTICE "run nothing"
		echo "please Usage:"
		echo "$0 Git_Push Git_Push_Comment"
		echo "$0 Git_Pull"
	}
esac

NOTICE "-----------------------END-------------------"

exit 0

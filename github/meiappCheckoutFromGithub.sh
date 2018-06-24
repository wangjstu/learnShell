#!/bin/bash
function RUNCMD() {
	echo "[$(date +'%Y-%m-%d %H:%M:%S:%N')][notice] $*"
	echo -e "\033[41;30m ####################EVAL LOG####################### \033[0m"
	eval $@
	echo -e "\033[41;30m ####################EVAL LOG####################### \033[0m"
}

function NOTICE() {
	echo >/dev/null && echo "[$(date +'%Y-%m-%d %H:%M:%S:%N')][notice] $*"
}


function Git_Pull() {
	RUNCMD "git pull origin master"
}

NOTICE "----------------------BEGIND Git_Pull-----------------"
Git_Pull
NOTICE "-----------------------END Git_Pull-------------------"

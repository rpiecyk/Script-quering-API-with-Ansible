#!/usr/bin/sh

## vars
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

check_if_root() {
	[ "$(id -u)" -ne 0 ] &&\
	printf '\nThis script must be run by root user.\n\n' >/dev/null 1>&2 && exit 1
}

install_ansible() {
	printf "\nInstalling ansible...\n\n"
	apt-get update -y >log 2>&1
	apt-get install software-properties-common -y >>log 2>&1
	apt-add-repository --yes --update ppa:ansible/ansible >>log 2>&1
	apt-get install -y ansible >>log 2>&1
	ansible-galaxy collection install community.docker >>log 2>&1
}

check_log() {
	printf "\nCheck log file at: $1/log\n\n"
}
## func
check_if_root
install_ansible && rm ${SCRIPTPATH}/log && exit 0 || check_log ${SCRIPTPATH}

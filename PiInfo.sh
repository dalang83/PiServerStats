#!/usr/bin/env bash
#Script for Outputting to CLI Info about the current stats of the PiHole Home Server. Will list the Active Daemons, Disk Stats,
#a Current Speedtest and Pihole status


#Introduction followed by outputs with clearing of proceeding information.

clear;
	echo -e "$(tput setaf 1)Welcome to the PiHomeServer Status Script $USER: $(tput sgr 0) \n"

	echo -e "$(tput setaf 1)Active Web Daemons: $(tput sgr 0) \n"

		sudo netstat -nultp | awk 'NR>2' | cut -d "/" -f2 | cut -d ' ' -f 1 | sed 's/://' | sort -u | sed 's/\(.*\)/  \1/'
		sleep 2
	echo

	echo -e "$(tput setaf 1)Disk Statistics: $(tput sgr 0) \n"

			sudo iostat -h | sed 's/\(.*\)/  \1/'

			sudo lsblk | sed 's/\(.*\)/  \1/'
		sleep 2
	echo

	echo -e "$(tput setaf 1)PiHole Status: $(tput sgr 0) \n"

		pihole status
	echo
		sleep 2

	echo -e "$(tput setaf 1)Unbound Status: $(tput sgr 0) \n"

		systemctl status unbound | grep 'Active:'
		sleep 2
	echo

	echo -e "$(tput setaf 1)Running a speedtest please be patient ... $(tput sgr 0) \n"

			speedtest-cli --simple | sed 's/\(.*\)/  \1/'
		sleep 2
	echo

	echo -e "$(tput setaf 1)Process complete ... $(tput sgr 0)"

		sleep 1




#!/bin/bash
BLUE='\e[1;34m'
GREEN='\e[1;32m'
RED='\e[1;31m'
NC='\033[0m' # No Color

# Refresh
echo -e "${BLUE}Refreshing Sources${NC}\n"
apt update
res_code=$?
if [ $res_code != 0 ]
then 
	echo -e "${RED}Couldn't refresh sources${NC}"
else
	echo -e "${GREEN}Sources Succesfully refreshed${NC}"
fi

# Software-properties-common
echo -e "${BLUE}Installing Software-properties-common${NC}\n"
apt install software-properties-common
res_code=$?
if [ $res_code != 0 ]
then 
	echo -e "${RED}Couldn't install Software-properties-common${NC}"
else
	echo -e "${GREEN}Software-properties-common Succesfully installed${NC}"
fi

# Sublime-Text
echo -e "${BLUE}Installing Sublime Text${NC}\n"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
apt install apt-transport-https
echo -e "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
apt update
apt install sublime-text
res_code=$?
if [ $res_code != 0 ]
then 
	echo -e "${RED}Couldn't install sublime text${NC}"
	echo -e "${BLUE}Try apt -f and re-run the script\n"
	exit ${res_code}
else
	echo -e "${GREEN}Completed installation for Sublime Text${NC}\n"
fi

# Subversion
echo -e "${BLUE}Installing Subversion${NC}\n"
apt install subversion
res_code=$?
if [ $res_code != 0 ]
then 
	echo -e "${RED}Couldn't install subversion${NC}"
	echo -e "${BLUE}Try apt -f and re-run the script\n"
	exit ${res_code}
else
	echo -e "${GREEN}Completed installation for Subversion${NC}\n"
fi

# Postgres+Postgis
echo -e "${BLUE}Installing Postgres+postgis${NC}\n"
apt install wget ca-certificates
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc |  apt-key add -
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
apt update
apt upgrade
apt install postgresql-9.5-postgis-2.2
res_code=$?
if [ $res_code != 0 ]
then 
	echo -e "${RED}Couldn't install Postgres+postgis${NC}"
	echo -e "${BLUE}Try apt -f and re-run the script\n"
	exit ${res_code}
else
	echo -e "${GREEN}Completed installation for Postgres+postgis${NC}\n"
fi

# Install the .deb packages
for deb_p in debs/* ; do
	echo -e "${BLUE}Installing ${deb_p}${NC}\n"
	dpkg -i ${deb_p}
	res_code=$?
	if [ $res_code != 0 ]
	then
		echo -e "${RED}Instalation failed for ${deb_p}${NC}"
		echo -e "${BLUE}Try apt -f and re-run the script\n"
		exit ${res_code}
	else
		echo -e "${GREEN}Completed Instalation for ${deb_p}${NC}\n"
	fi
done

# Installing other packages
cd "sw"
for dir in */ ; do
	cd "$dir"
	echo -e "${BLUE}Installing ${dir}${NC}\n"
	chmod +x ./*.sh
	./*.sh
	res_code=$?
	if [ $res_code != 0 ]
	then
		echo -e "${RED}Instalation failed for ${dir}${NC}"
		exit ${res_code}
	else
		echo -e "${GREEN}Completed Instalation for ${dir}${NC}\n"
	fi
done
exit 0

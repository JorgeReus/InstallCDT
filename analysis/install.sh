#!/bin/bash
BLUE='\e[1;34m'
GREEN='\e[1;32m'
RED='\e[1;31m'
NC='\033[0m' # No Color

# Refresh
echo "${BLUE}Refreshing Sources${NC}\n"
apt update
res_code=$?
if [ $res_code != 0 ]
then 
	echo "${RED}Couldn't refresh sources${NC}"
else
	echo "${GREEN}Sources Succesfully refreshed${NC}"
fi


# texlive-full
echo "${BLUE}Installing texlive-full${NC}\n"
apt install texlive-full
res_code=$?
if [ $res_code != 0 ]
then 
	echo "${RED}Installation failed for texlive-full${NC}"
	echo "${BLUE}Try apt -f and re-run the script\n"
else
	echo "${GREEN}Installation completed for texlive-full\n${NC}"
fi

# TexStudio
echo "${BLUE}Installing texstudio${NC}\n"
add-apt-repository ppa:sunderme/texstudio
apt update
apt install texstudio
res_code=$?
if [ $res_code != 0 ]
then 
	echo "${RED}Installation failed for texstudio${NC}"
	echo "${BLUE}Try apt -f and re-run the script\n"
else
	echo "${GREEN}Installation completed for texstudio\n${NC}"
fi

# Subversion
echo "${BLUE}Installing Subversion${NC}\n"
apt install subversion
res_code=$?
if [ $res_code != 0 ]
then 
	echo "${RED}Couldn't install subversion${NC}"
	echo "${BLUE}Try apt -f and re-run the script\n"
	exit ${res_code}
else
	echo "${GREEN}Completed installation for Subversion${NC}\n"
fi

# Wine
echo "${BLUE}Installing Wine${NC}\n"
dpkg --add-architecture i386
apt update
apt install wine
res_code=$?
if [ $res_code != 0 ]
then 
	echo "${RED}Couldn't install wine${NC}"
	echo "${BLUE}Try apt -f and re-run the script\n"
	exit ${res_code}
else
	echo "${GREEN}Completed installation for wine${NC}\n"
fi

# Wine Development
echo "${BLUE}Installing Wine Development${NC}\n"
apt install wine-development
res_code=$?
if [ $res_code != 0 ]
then 
	echo "${RED}Couldn't install Wine Development${NC}"
	echo "${BLUE}Try apt -f and re-run the script\n"
	exit ${res_code}
else
	echo "${GREEN}Completed installation for Wine Development${NC}\n"
fi

# Installing other packages
cd "sw"
for dir in */ ; do
	cd "$dir"
	echo "${BLUE}Installing ${dir}${NC}\n"
	./*.sh
	res_code=$?
	if [ $res_code != 0 ]
	then
		echo "${RED}Instalation failed for ${dir}${NC}"
		exit ${res_code}
	else
		echo "${GREEN}Completed Instalation for ${dir}${NC}\n"
	fi
done

exit 0


# InstallCDT
A script for installing software in my workplace
## Rules
* All .deb files belong to the debs directory
* The custom commands for installing software (e.g. apt) belong in the install.sh file
* Other packages (e.g. tar.gz dists) belong in the sw directory
* The script for installing software in the sw directory must have bash shebang (i.e. !#/usr/bin/bash)
* The script must be exited with the command exit
* The script must delete the unziped files at the end
* Each directory must be named with the name of the software to be installed
* Each directory must contain only one .sh script containing the commands used for the installation

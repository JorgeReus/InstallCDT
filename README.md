# InstallCDT
A script for installing software in my workplace
## All .deb files belong to the debs directory
## The custom commands for installing software (e.g. apt) belong in the install.sh file
## Other packages (e.g. tar.gz dists) belong in the sw directory
## Rules
* The script for installing software in the sw directory must have bash shebang (i.e. !#/usr/bin/bash)
* The script must be exited with the command exit
* The script must delete the unziped files at the end

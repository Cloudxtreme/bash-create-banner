# bash-create-banner
Bash script for generating banner directory structure and files with default content.

This bash script auto generates HTML5 banner directory structure and files with correct heights/widths and names from the command line. 

To enable: cd to /usr/bin/local and copy in create.sh

To run: in terminal: bash create.sh -w 180 -h 600 -n foo

Options: -w is width, -h is height -n is the name of the customer. -n outputs mainly to the index.html title and manifest.json adform link. 

Improvements to come. 

For windows: Download and install http://gitextensions.github.io/ then copy create.sh to directory you wish to run it in.  (there must be a similar location to /usr/bin/local on Windows but I am not aware of it yet) Open Powershell and run command. (NEED TO TEST)

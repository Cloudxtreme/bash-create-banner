# bash-create-banner
Bash script for generating banner directory structure and files with default content.

This bash script auto generates HTML5 banner directory structure and files with correct heights/widths and names from the command line. 

To enable: cd to `/usr/bin/local` and copy in create.sh

To run: in terminal: `bash create.sh -w 180 -h 600 -n foo`

Options: `-w` is width, `-h` is height `-n` is the name of the customer. -n outputs mainly to the index.html title and manifest.json adform link. 

**For windows:** Download and install http://gitextensions.github.io/ (use setup complete) create a directory called bin under `C:/Users/$USER/` and copy create.sh into it. 

Open Git Bash application and type `echo $PATH` You should see `/c/Users/$USER/bin` If you see this, you are ready to run the script in Git Bash in any directory on the computer.  

If not, go to `Control Panel>Sytem>Advanced System Settings>Evironment Variables` and in the `System Variables` window add a new variable called `bin` with Variable Value add `C:/Users/$USER/bin` and click ok. 

To run the script, you must use Git Bash. 

#zipper

Zipper zips each directory into its own archive. No options, just zipping. Copy zipper.sh into your bin folder, run as `bash zipper.sh` and watch output. Zipper updates each zip archive with latest files if the zip archive already exsits. 

**For Windows:** Download unzip.exe and zip.exe from [Stahlworks dev tools](http://stahlworks.com/dev/?tool=zipunzip) and place them into your bin directory before running the script. 

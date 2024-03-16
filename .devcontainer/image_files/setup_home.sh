#!/bin/sh

SRCDIR=/usr/local/share/homedir_files
DESTDIR=/home/user

printf "Copying dot files to homedir...\n"

cp -v ${SRCDIR}/.bash_logout ${DESTDIR}
cp -v ${SRCDIR}/.bashrc ${DESTDIR}
cp -v ${SRCDIR}/.profile ${DESTDIR}

printf "\nEither log out and rerun the container, or run the following\n"
printf "on the command line right now:\n\n"
printf "source ~/.profile\n"
printf "source ~/.bashrc\n\n"


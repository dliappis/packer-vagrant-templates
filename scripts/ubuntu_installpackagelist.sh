#!/bin/bash
while read packagename
do
    apt-get -y install ${packagename}
done </home/vagrant/packagelist.txt

# Install packages with unique name in Ubuntu
UBUNTUPACKAGES="
emacs24-nox
"
apt-get -y install $UBUNTUPACKAGES

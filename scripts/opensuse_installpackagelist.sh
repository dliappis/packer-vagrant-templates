#!/bin/bash
while read packagename
do
    zypper -q -n install --force-resolution ${packagename}
done </tmp/packagelist.txt

# Install packages with unique name in OpenSUSE
OPENSUSEPACKAGES="
emacs-nox
"
zypper -q -n install --force-resolution $OPENSUSEPACKAGES

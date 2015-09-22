#!/bin/bash

## Run this ONLY if this is a virtualbox builder

if [[ $PACKER_BUILDER_TYPE =~ virtualbox ]]
then
    # build-essentials (deb family) or devel_C_C++ (zypper) is required

    # Mount the disk image
    cd /tmp
    mkdir /tmp/isomount
    mount -t iso9660 -o loop /home/vagrant/VBoxGuestAdditions.iso /tmp/isomount
    
    # Install the drivers
    /tmp/isomount/VBoxLinuxAdditions.run

    # Cleanup
    umount isomount
    rm -rf isomount /home/vagrant/VBoxLinuxAdditions.iso
fi

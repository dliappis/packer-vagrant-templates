#!/bin/bash

if [[ ! $PACKER_BUILDER_TYPE =~ amazon-ebs ]]
then
    rm /etc/localtime
    ln -s /usr/share/zoneinfo/UTC /etc/localtime
fi

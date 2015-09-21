#!/bin/sh

# Store build time
date > /etc/vagrant_box_build_time

# remove zypper package locks
rm -f /etc/zypp/locks

# Set up sudo
echo 'vagrant ALL=NOPASSWD:ALL' > /etc/sudoers.d/vagrant

# Install vagrant key
mkdir -pm 700 /home/vagrant/.ssh
wget --no-check-certificate https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
#chown -R vagrant:vagrant /home/vagrant/.ssh
chown -R vagrant /home/vagrant/.ssh

# NFS used for file syncing

#apt-get --yes install nfs-common
# zypper --non-interactive install --no-recommends --force-resolution nfs-client

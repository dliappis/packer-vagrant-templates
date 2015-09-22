#!/bin/sh

rm /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/

# Disable DNS reverse lookup
echo "UseDNS no" >> /etc/ssh/sshd_config

# disable gem docs
echo "gem: --no-ri --no-rdoc" >/etc/gemrc

# backlist i2c_piix4 - VirtualBox has no smbus
echo "blacklist i2c_piix4" > /etc/modprobe.d/100-blacklist-i2c_piix4.conf

# put shutdown command in path
ln -s /sbin/shutdown /usr/bin/shutdown

# ntp servers
printf "%b" "
# added by packer postinstall.sh
server 0.pool.ntp.org
server 1.pool.ntp.org
server 2.pool.ntp.org
server 3.pool.ntp.org
" >> /etc/ntp.conf

#!/bin/bash

yum -y install gcc make kernel-devel perl
mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt
sh /mnt/VBoxLinuxAdditions.run --nox11
umount /mnt
rm -f /home/vagrant/VBoxGuestAdditions.iso
rm -f /home/vagrant/.vbox_version

rm -f /etc/machine-id
touch /etc/machine-id

rm -f /etc/udev/rules.d/70-persistent-net.rules
ln -s -f /dev/null /etc/udev/rules.d/70-persistent-net.rules
rm -f /lib/udev/rules.d/75-persistent-net-generator.rules

yum -y clean all

rm -f /var/lib/dhclient/*
rm -rf /tmp/*

dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

sync

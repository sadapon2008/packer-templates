#!/bin/bash

yum -y install gcc make kernel-devel perl bzip2
mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt
sh /mnt/VBoxLinuxAdditions.run --nox11 -- --force
umount /mnt
rm -f /home/vagrant/VBoxGuestAdditions.iso
rm -f /home/vagrant/.vbox_version

rm -f /etc/machine-id
touch /etc/machine-id

yum -y clean all

rm -f /var/lib/dhclient/*
rm -rf /tmp/*

dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

sync

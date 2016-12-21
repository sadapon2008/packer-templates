#!/bin/bash

sed -i "s/^#AddressFamily .*/AddressFamily inet/" /etc/ssh/sshd_config
sed -i "s/^#UseDNS .*/UseDNS no/" /etc/ssh/sshd_config
sed -i "s/^GSSAPIAuthentication yes/GSSAPIAuthentication no/" /etc/ssh/sshd_config
echo 'GATEWAYDEV=eth0' >>/etc/sysconfig/network
echo "include_only=.jp" >> /etc/yum/pluginconf.d/fastestmirror.conf
yum -y update
reboot
sleep 60

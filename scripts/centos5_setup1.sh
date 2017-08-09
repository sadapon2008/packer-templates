#!/bin/bash

sed -i -e 's/^\(mirrorlist=http:\/\/mirrorlist\.centos\.org\)/#\1/g' /etc/yum.repos.d/CentOS-Base.repo
sed -i -e 's/^\(#baseurl=http:\/\/mirror\.centos\.org\/centos\/$releasever\)/baseurl=http:\/\/vault.centos.org\/5.11/g' /etc/yum.repos.d/CentOS-Base.repo

sed -i "s/^#AddressFamily .*/AddressFamily inet/" /etc/ssh/sshd_config
sed -i "s/^#UseDNS .*/UseDNS no/" /etc/ssh/sshd_config
sed -i "s/^GSSAPIAuthentication yes/GSSAPIAuthentication no/" /etc/ssh/sshd_config
echo 'GATEWAYDEV=eth0' >>/etc/sysconfig/network
yum -y update
reboot
sleep 60

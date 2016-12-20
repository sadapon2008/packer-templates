#!/bin/bash

sed -i "s/^#AddressFamily .*/AddressFamily inet/" /etc/ssh/sshd_config
sed -i "s/^#UseDNS .*/UseDNS no/" /etc/ssh/sshd_config
sed -i "s/^GSSAPIAuthentication yes/GSSAPIAuthentication no/" /etc/ssh/sshd_config
cat << EOF > /etc/NetworkManager/dispatcher.d/99-dns-option
#!/bin/sh
echo options single-request-reopen >> /etc/resolv.conf
EOF
chmod +x /etc/NetworkManager/dispatcher.d/99-dns-option
echo "include_only=.jp" >> /etc/yum/pluginconf.d/fastestmirror.conf
yum -y update
reboot
sleep 60

set -x

apt-get -y --purge remove linux-headers-$(uname -r)
apt-get -y --purge autoremove
apt-get -y purge $(dpkg --list |grep '^rc' |awk '{print $2}')
apt-get -y purge $(dpkg --list |egrep 'linux-image-[0-9]' |awk '{print $3,$2}' |sort -nr |tail -n +2 |grep -v $(uname -r) |awk '{ print $2}')
apt-get -y clean

echo "cleaning up dhcp leases"
rm /var/lib/dhcp/* 2>/dev/null

echo "cleaning up udev rules"
rm /etc/udev/rules.d/70-persistent-net.rules 2>/dev/null
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm /lib/udev/rules.d/75-persistent-net-generator.rules 2>/dev/null
rm -rf /dev/.udev/ 2>/dev/null

echo "cleaning bash history"
unset HISTFILE
rm ~/.bash_history /home/vagrant/.bash_history 2>/dev/null

exit 0

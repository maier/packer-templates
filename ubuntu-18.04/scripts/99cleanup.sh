set -x


# remove x11 (it's a server...)
apt-get remove -y libx11.* libqt.*

apt-get autoremove -y
apt-get clean -y
#rm -f /var/cache/apt/*cache.bin
#rm -f /var/lib/apt/lists/*

echo "cleaning up dhcp leases"
rm /var/lib/dhcp/*

#echo "cleaning up udev rules"
#rm /etc/udev/rules.d/70-persistent-net.rules
#mkdir /etc/udev/rules.d/70-persistent-net.rules
#rm -rf /dev/.udev/
#rm /lib/udev/rules.d/75-persistent-net-generator.rules

exit 0

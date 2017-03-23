set -x

# install tools required
apt-get install -y gcc dkms

VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
cd /tmp
mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf /home/vagrant/VBoxGuestAdditions_*.iso

# remove tools installed to build guest additions
apt-get purge -y gcc dkms
apt-get autoremove -y --purge

exit 0

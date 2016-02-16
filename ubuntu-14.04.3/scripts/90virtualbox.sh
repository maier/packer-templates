set -x

#apt-get install -y build-essential module-assitant linux-headers-$(uname -r)

# install tools required
apt-get install -y gcc dkms

cd /tmp
[[ -f VBoxGuestAdditions_5.0.14.iso ]] || curl "http://download.virtualbox.org/virtualbox/5.0.14/VBoxGuestAdditions_5.0.14.iso" -O
mount -o loop VBoxGuestAdditions_5.0.14.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt

# remove tools installed to build guest additions
apt-get purge -y gcc dkms
apt-get autoremove -y --purge

#apt-get purge -y build-essential module-assitant linux-headers-$(uname -r)
#apt-get autoremove -y --purge

exit 0

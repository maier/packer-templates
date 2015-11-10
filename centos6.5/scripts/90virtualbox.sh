set -ux

#
# packages need to install VBGA
#
yum -y install perl make gcc kernel-devel-`uname -r`

VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
cd /tmp
mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf /home/vagrant/VBoxGuestAdditions_*.iso

#
# remove the packages installed to build the guest additions
#
yum -y history undo last

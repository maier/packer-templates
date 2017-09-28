set -ux

#
# packages need to install VBGA
#
yum -y install bzip2 perl kernel-devel-`uname -r` dkms gcc
yum_rev=$(yum history stats | grep -E "^Transactions:" | cut -d : -f 2)

VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
cd /tmp
mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf /home/vagrant/VBoxGuestAdditions_*.iso

#
# remove the packages installed to build the guest additions
#
[[ -n "$yum_rev" ]] && yum -y history undo $yum_rev

set -x

#apt-get install -y build-essential module-assitant linux-headers-$(uname -r)

# install tools required
apt-get install -y gcc dkms

vbga_ver="5.0.28"
vbga_iso="VBoxGuestAdditions_${vbga_ver}.iso"
vbga_url="http://download.virtualbox.org/virtualbox/${vbga_ver}/${vbga_iso}"
cd /tmp
[[ -f $vbga_iso ]] || curl "$vbga_url" -o $vbga_iso
mount -o loop $vbga_iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt

# remove tools installed to build guest additions
apt-get purge -y gcc dkms
apt-get autoremove -y --purge

#apt-get purge -y build-essential module-assitant linux-headers-$(uname -r)
#apt-get autoremove -y --purge

exit 0

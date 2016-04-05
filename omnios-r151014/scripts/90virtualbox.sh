set -ex

VBOX_VERSION=$(cat /root/.vbox_version)

mount -F hsfs -o ro $(lofiadm -a /root/VBoxGuestAdditions_${VBOX_VERSION}.iso) /mnt
cat <<EOF >> /root/admtemp
mail=
instance=unique
partial=nocheck
runlevel=nocheck
idepend=nocheck
rdepend=nocheck
space=nocheck
setuid=nocheck
conflict=nocheck
action=nocheck
basedir=default
EOF

cd /mnt
pkgadd -n -a /root/admtemp -G -d ./VBoxSolarisAdditions.pkg all
cd
umount /mnt
rm /root/admtemp

set -eux

/usr/local/sbin/apk-install sudo
adduser vagrant wheel

echo "Defaults exempt_group=wheel" > /etc/sudoers
echo "%wheel ALL=NOPASSWD:ALL" >> /etc/sudoers

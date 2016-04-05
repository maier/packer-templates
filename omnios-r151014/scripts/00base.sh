set -ex

## auto-home
echo '*       localhost:/export/home/&' >> /etc/auto_home

## grub_timeout
sed -i 's/timeout 30/timeout 1/' /rpool/boot/grub/menu.lst

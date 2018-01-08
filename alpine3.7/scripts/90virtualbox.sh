set -eux

echo http://dl-cdn.alpinelinux.org/alpine/v3.7/community >> /etc/apk/repositories
apk add -U virtualbox-guest-additions virtualbox-guest-modules-virthardened
rc-update add virtualbox-guest-additions
echo vboxsf >> /etc/modules

set -eux

echo http://dl-cdn.alpinelinux.org/alpine/v3.8/community >> /etc/apk/repositories
apk add -U virtualbox-guest-additions virtualbox-guest-modules-vanilla
rc-update add virtualbox-guest-additions
echo vboxsf >> /etc/modules

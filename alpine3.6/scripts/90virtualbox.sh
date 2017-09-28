set -eux

echo http://dl-cdn.alpinelinux.org/alpine/v3.6/community >> /etc/apk/repositories
apk add -U virtualbox-guest-additions virtualbox-guest-modules-hardened
rc-update add virtualbox-guest-additions
echo vboxsf >> /etc/modules

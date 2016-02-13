set -ux

apk update && apk upgrade

cat << EOF > /etc/motd

Alpine 3.2.3 Development Environment

Built for use with Vagrant using:
   <https://github.com/maier/packer-templates>

See the Alpine Wiki for how-to guides and
general information about administrating 
Alpine systems and development.
See <http://wiki.alpinelinux.org>

EOF



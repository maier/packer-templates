set -eux

# update is already performed in the kickstart so
# that the VM boots with the newest kernel
#yum -y update

echo "CentOS 6.5 Development Environment" > /etc/motd

#
# add additional package installs here
#

exit 0

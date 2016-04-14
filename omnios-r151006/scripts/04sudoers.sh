set -ex

# Allow vagrant passwordless sudo
echo 'vagrant ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/vagrant

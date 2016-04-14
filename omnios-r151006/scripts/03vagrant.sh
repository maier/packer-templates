set -ex

# Fix vagrant's homedir
usermod -d /home/vagrant vagrant

# Install vagrant's SSH pubkey
mkdir -p /export/home/vagrant/.ssh
chmod 700 /export/home/vagrant/.ssh
curl -sSo /export/home/vagrant/.ssh/authorized_keys 'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub'
chmod 600 /export/home/vagrant/.ssh/authorized_keys
chown -R vagrant /export/home/vagrant/.ssh

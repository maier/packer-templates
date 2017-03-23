set -ex


# Vagrant specific
date > /etc/vagrant_box_build_time

mkdir -pm 700 /home/vagrant/.ssh
curl -o /home/vagrant/.ssh/authorized_keys 'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub'
chown -R vagrant:vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh

exit 0

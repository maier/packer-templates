set -ex

# Vagrant specific
date > /etc/vagrant_box_build_time

if [ $(grep -c vagrant /etc/passwd) -eq 0 ] ; then
    useradd vagrant -m
fi

mkdir -pm 700 /home/vagrant/.ssh
curl -o /home/vagrant/.ssh/authorized_keys 'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub'
chown -R vagrant:vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh

set -x

echo

echo "removing xll packages (server not desktop...)"
apt-get remove -y libx11.* libqt.*

echo "update remaining packages"
apt-get update

echo "purging packages which are no longer needed"
apt-get autoremove -y

echo "setting up sudo for vagrant user"

echo "vagrant ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/vagrant
chmod 440 /etc/sudoers.d/vagrant

echo "Defaults !requiretty" >> /etc/sudoers

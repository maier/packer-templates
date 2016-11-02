set -x

# remove x11 crap
apt-get remove -y libx11.* libqt.*

# update remaining packages
apt-get update
apt-get -y upgrade

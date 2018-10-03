set -x

# update remaining packages
export DEBIAN_FRONTEND=noninteractive
apt-get -yq update
apt-get -yq upgrade

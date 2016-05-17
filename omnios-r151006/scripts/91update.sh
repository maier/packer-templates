set -ex

## update OS
pkg install pkg:/package/pkg
pkg update

reboot
sleep 60

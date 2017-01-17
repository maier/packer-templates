set -e


## Update pkg (if needed)
echo "Update 'pkg', if required"
pkg install pkg:/package/pkg

echo "Adding omniti-ms publisher"
pkg set-publisher -g http://pkg.omniti.com/omniti-ms/ ms.omniti.com

## Update OS
echo "Updating OS"
pkg update

echo "Rebooting post-update"
reboot

sleep 60

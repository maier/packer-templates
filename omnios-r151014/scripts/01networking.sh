set -ex

# default to google's public name servers
dns="nameserver 8.8.8.8\nnameserver 8.8.4.4"

# see if vagrant supplied a name server in dhcp
vns="$(/sbin/dhcpinfo DNSServ)"

if [[ -n "${vns:-}" ]]; then
    echo "nameserver ${vns}" > /etc/resolv.conf
else
    echo -e "$dns" > /etc/resolv.conf
fi

cp /etc/nsswitch.dns /etc/nsswitch.conf

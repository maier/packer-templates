set -ex

sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/X11Forwarding yes/X11Forwarding no/' /etc/ssh/sshd_config

cat <<EOF >> /etc/ssh/sshd_config
LookupClientHostnames no
EOF

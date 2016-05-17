set -ex

sed -i 's/X11Forwarding yes/X11Forwarding no/' /etc/ssh/sshd_config

cat <<EOF >> /etc/ssh/sshd_config
LookupClientHostnames no
EOF

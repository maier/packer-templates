echo "Installing development environment"
/usr/bin/pkg install \
  developer/gcc48 \
  developer/build/autoconf \
  developer/build/automake \
  developer/lexer/flex \
  developer/parser/bison \
  developer/object-file \
  developer/linker \
  developer/library/lint \
  developer/build/gnu-make \
  library/idnkit \
  library/idnkit/header-idnkit \
  system/header \
  system/library/math \
  developer/versioning/git \
  omniti/runtime/go \
  developer/versioning/mercurial

echo "Updating vagrant's ~/.bash_profile"
cat >> /home/vagrant/.bash_profile <<EOF
export PATH="/opt/gcc-4.8.1/bin:/usr/gnu/bin:/usr/xpg4/bin:/usr/bin:/usr/sbin:/sbin"
export GOROOT_BOOTSTRAP=/opt/go
source ~/.gvm/scripts/gvm
EOF

cat > /tmp/goinst.sh <<GOINST
echo "...Installing gvm (go version manager) for $USER"
/usr/bin/curl -sSL https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | bash -s

source ~/.bash_profile

echo "...Installing go v1.7.4"
gvm install go1.7.4
gvm use go1.7.4 --default
GOINST

echo "Installing go environment"
sudo -u vagrant -i bash /tmp/goinst.sh

exit 0

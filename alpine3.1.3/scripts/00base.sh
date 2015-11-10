set -ux

echo "Alpine 3 Development Environment" > /etc/motd

#
# Note, apk does *NOT* set exit code to non-zero when
# an error occurs. Which seems to be fairly frequent...
# TODO: fix this when new apk which *does* exit correctly
# is released to main.
#

#
# give update/upgrade three attempts
#
for i in `seq 3`; do

    apk update
    apk upgrade

done

set -eux

#
# this goes away when apk exits with a code other than 0 when it fails
#

dest_dir="/usr/local/sbin"
[ -d $dest_dir ] || mkdir -p $dest_dir
dest_file="$dest_dir/apk-install"
if [ ! -f $dest_file ]; then
    cat <<'EOF1' > $dest_file
#!/bin/sh

max_retries=3
cur_attempt=1
errors=0
msg=""
log="/tmp/apk-install.log"
while [ $cur_attempt -lt $max_retries ]; do
    echo "Attempt $cur_attempt of $max_retries $(date)" > $log
    echo "cmd: apk add $*" >> $log

    apk add $* &> $log
    cat $log

    errors=$(grep -c "ERROR:" $log)
    if [ $errors -eq 0 ]; then
        break
    fi

    : $((cur_attempt = $cur_attempt + 1))
    echo "Attempt $cur_attempt of $max_retries"
done

if [ $errors -gt 0 ]; then
    cat $log
    echo "Persisent ERRORs adding '$*' after $max_retries attempts."
fi

exit $errors
EOF1
    chown root:root $dest_file
    chmod 755 $dest_file
fi

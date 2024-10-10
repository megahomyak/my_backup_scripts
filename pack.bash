#!/bin/bash
BACKUP_DIR=~/i
read -s -p "Password: " password \
&& echo \
&& tar -I 'zstd -19' -cf backup.tar.zst -C $BACKUP_DIR . \
&& gpg --batch --yes --passphrase "${password}" --symmetric --cipher-algo AES256 -o backup.tar.zst.gpg backup.tar.zst \
&& rm backup.tar.zst

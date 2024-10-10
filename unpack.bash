#!/bin/bash
BACKUP_DIR=~/i
read -s -p "Password: " password \
&& echo \
&& gpg --batch --yes --passphrase "${password}" --output backup.tar.zst --decrypt backup.tar.zst.gpg \
&& rm backup.tar.zst.gpg \
&& mkdir -p $BACKUP_DIR \
&& tar -I zstd -xf backup.tar.zst -C $BACKUP_DIR \
&& rm backup.tar.zst

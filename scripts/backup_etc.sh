#!/bin/bash

# Remove old backup (if it exists)
rm -rf /root/etc-backup

# Create new backup folder
mkdir -p /root/etc-backup

# Copy everything from /etc to /root/etc-backup
cp -a /etc/. /root/etc-backup/


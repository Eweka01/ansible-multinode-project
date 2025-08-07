#!/bin/bash
mkdir -p /root/etc-backup
rsync -av /etc/ /root/etc-backup

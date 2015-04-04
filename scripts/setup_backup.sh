#!/bin/bash -xe

## UNTESTED

parentdir="$(dirname "$PWD")"

#BACKUP_DIR="/home/$USER/.backups"
BACKUP_DIR="$HOME/.backups"

if [ ! -d "$BACKUP_DIR" ]
then
  mkdir -p "$BACKUP_DIR"
fi


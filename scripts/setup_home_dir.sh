#!/bin/bash -xe

parentdir="$(dirname "$PWD")"

user="$USER"
echo "Current user is $user"

if [ ! -d "$HOME" ]
then
  sudo mkdir -p "$HOME"
  sudo chown -R "$user" "$HOME"
  sudo chmod -R 755 "$HOME"
fi


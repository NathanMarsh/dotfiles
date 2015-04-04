#!/bin/bash -xe

## UNTESTED

parentdir="$(dirname "$PWD")"

#VIM_VERSION="vim74"
VIM_VERSION_NO=`vim --version | head -n 1 | grep -ohP '\s+\d+\.\d+\s+' | sed 's/[^0-9]//g'`
VIM_VERSION="vim$VIM_VERSION_NO"

echo "Got vim version $VIM_VERSION"
VIM_ROOT="/usr/share/vim/$VIM_VERSION"

if [ -f "$FILE" ]
then
  mv ~/.vimrc /tmp
fi
ln -s "$parentdir/.vimrc" ~/.vimrc

HIVE_VIM_LOCATION="$VIM_ROOT/syntax/hive.vim"
sudo mv $HIVE_VIM_LOCATION /tmp
sudo ln -s "$parentdir/scripts/resources/vim_stuff/hive.vim" $HIVE_VIM_LOCATION


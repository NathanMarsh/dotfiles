#!/bin/bash -xe

TMUX_LATEST_VERSION="tmux 1.9a"
parentdir="$(dirname "$PWD")"
TMUX_LOCATION='http://downloads.sourceforge.net/project/tmux/tmux/tmux-1.9/tmux-1.9a.tar.gz?r=http%3A%2F%2Ftmux.sourceforge.net%2F&ts=1412538110&use_mirror=iweb'
if [ "`tmux -V`" == "$TMUX_LATEST_VERSION" ]
then
	echo "tmux at correct version"
else
        echo "Trying to upgrade tmux to $TMUX_LATEST_VERSION"
	TMPD="/tmp/default_setup"
	TMPD_UBUNTU="$TMPD/ubuntu"
	rm -rf "$TMPD"
	mkdir -p "$TMPD_UBUNTU"
	cd "$TMPD_UBUNTU"
	wget "$TMUX_LOCATION" -O tmux-latest.tar.gz
	tar xzf tmux-latest.tar.gz
	rm tmux-latest.tar.gz
	cd `ls -Art | tail -n 1`
	#sudo apt-get update --fix-missing
	sudo apt-get install gcc libevent-dev libncurses5-dev make python-software-properties software-properties-common g++
	./configure
	make
	sudo make install
fi

if [ -f ~/.tmux.conf ]; then
    echo "Trying to rename"
    mv ~/.tmux.conf ~/.tmux.conf.bak
fi
#mv ~/.tmux.conf ~/.tmux.conf.bak
#echo "Parent directory is $parentdir"

ln -s "$parentdir/.tmux.conf" ~
touch ~/.tmux.local

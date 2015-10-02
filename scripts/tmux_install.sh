#!/bin/bash -xe

mkcd () {
        if [ ! -z "$1" ]
        then
                echo "Got input $1"
                if [ -d "$1" ]
                then
                        echo "Folder already exists"
                        cd "$1"
                else
                        echo "Creating a new folder $1"
                        mkdir -p "$1"
                        cd "$1"
                fi
        else
                echo "Got no input, creating a temporary directory"
                tempdir=`mktemp -d`
                cd "$tempdir"
        fi
}

TMUX_GIT_PATH="https://github.com/tmux/tmux.git"
mkcd
git clone "$TMUX_GIT_PATH"
cd tmux

sudo apt-get install gcc libevent-dev libncurses5-dev make python-software-properties software-properties-common g++
sh autogen.sh
./configure
make
#sudo make install

if [ -f ~/.tmux.conf ]; then
    echo "Trying to rename"
    mv ~/.tmux.conf ~/.tmux.conf.bak
fi
#mv ~/.tmux.conf ~/.tmux.conf.bak
#echo "Parent directory is $parentdir"

ln -s "$parentdir/.tmux.conf" ~
touch ~/.tmux.local

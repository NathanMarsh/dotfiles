#!/bin/bash

exit 1 #incomplete

# Verify with http://serverfault.com/questions/550276/how-to-block-internet-access-to-certain-programs-on-linux

sudo groupadd no-internet
grep no-internet /etc/group
#sudo useradd -g no-internet "$USER"
sudo usermod -g no-internet "$USER"


# TODO incomplete


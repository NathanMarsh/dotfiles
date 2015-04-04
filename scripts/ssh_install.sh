#!/bin/bash -xe

sudo apt-get install -y openssh-client openssh-server
#sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.original
#sudo chmod a-w /etc/ssh/sshd_config.original
sudo /etc/init.d/ssh restart


mkdir -p ~/.ssh
chmod 700 ~/.ssh
touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys


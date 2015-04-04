#!/bin/bash -xe
sudo apt-get -y install zsh
sudo chsh -s `which zsh`

./setup_home_dir.sh
./tmux_install.sh
./ip_tables.sh
./setup_dots.sh


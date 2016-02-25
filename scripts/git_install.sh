#!/bin/bash -xe

GIT_LATEST_VERSION="2.5.0"
ARCHIVE_FORMAT=".tar.gz"
ARCHIVE_PATH="https://github.com/git/git/archive/v$GIT_LATEST_VERSION$ARCHIVE_FORMAT"
echo "Will download archive from: $ARCHIVE_PATH"

cd $(mktemp -d)
wget "$ARCHIVE_PATH"
tar xzf "v$GIT_LATEST_VERSION$ARCHIVE_FORMAT"
cd "git-$GIT_LATEST_VERSION"

#Alternate way if git is installed:
#cd $(mktemp -d)
#git clone git://git.kernel.org/pub/scm/git/git.git

#Not tested. Try out since asciidoc is big and can live without it
#sudo apt-get install -y autoconf zlib1g-dev
#make all
#sudo make install

#Tested way (with 2.4.4), Installs documentation too
#sudo apt-get install -y autoconf zlib1g-dev asciidoc docbook2x libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev xmlto
#make all doc info
#sudo make install install-doc install-html install-info

#Tested with 2.5.0
make configure
./configure --prefix=/usr
sudo apt-get install -y autoconf zlib1g-dev asciidoc docbook2x libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev xmlto #Might be able to get away with lesser
make all doc info
sudo make install install-doc install-html install-info

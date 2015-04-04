#!/bin/bash -xe

filename="/etc/apt/apt.conf.d/99force-ipv4"
if [ ! -f "$filename" ]; then
    #sudo cp ./resources/99force-ipv4 "$filename" ##Enable this if ipv6 is a problem
    :
fi

wpath="http://mirror.sdunix.com/apache/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz"
wname="$(basename $wpath)"
wfilename="apache-maven-3.2.5"
echo "Base is $wname"
echo "Filename is $wfilename"
root=$HOME/Installs/maven
if [[ ! -d "$root" ]]; then
  mkdir -p $root
fi

cd "$root"
if [[ ! -f "$root/$wname" ]]; then
  wget "$wpath"
fi

tar xzf "$root/$wname"

rcpath=$HOME/.zshrc.maven
srcline="source $rcpath"
rc=$HOME/.zshrc

if ! grep -Fxq "$srcline" $rc
then
  echo "$srcline" >> $rc
fi

#echo "export M2_HOME=/usr/local/apache-maven/apache-maven-3.2.5" > "$rcpath"
echo "export M2_HOME=$root/$wfilename" > "$rcpath"
echo 'export M2=$M2_HOME/bin' >> "$rcpath"
echo 'export PATH=$M2:$PATH' >> "$rcpath"


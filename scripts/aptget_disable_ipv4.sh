#!/bin/bash -xe

filename="/etc/apt/apt.conf.d/99force-ipv4"
if [ ! -f "$filename" ]; then
    cp ./resources/99force-ipv4 "$filename"
fi


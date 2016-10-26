#!/bin/bash

sudo apt-get build-dep libdrm mesa
sudo apt-get install linux-headers-`uname -r`
sudo apt-get install libxi-dev libxmu-dev x11proto-xf86vidmode-dev
sudo apt-get install git autoconf automake libtool

# mesa
# libva
# libdrm
# cairo
# vaapi
# intel-gpu-tools

DIRETORIO_ATUAL=`pwd`

for i in mesa libva libdrm cairo vaapi intel-gpu-tools ; do
  mkdir /tmp/$i
  cd /tmp/$i
  apt-get source $i
  cd `ls -d $i-*/`
  sudo mk-build-dep -i -r $i
  fakeroot debian/rules binary
  fakeroot debian/rules clean
  cd ..
  dpkg -i *.deb
  cd $DIRETORIO_ATUAL
done;



#!/bin/bash

apt-cache policy nome_pacote

apt-get source nome_pacote

cd nome_paocte

mk-build-deps -i -r

fakeroot debian/rules binary

fakeroot debian/rules clean

cd ..

dpkg -i *.deb


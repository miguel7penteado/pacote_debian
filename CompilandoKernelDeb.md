# Compilando um Kernel através de um pacote Deb

```sh

apt-get install build-essential fakeroot

apt-get build-dep linux

mkdir tmp && cd tmp

apt-get source linux-image-$(uname -r)

cd linux-*

fakeroot debian/rules source

fakeroot make -f debian/rules.gen binary-arch_amd64

```

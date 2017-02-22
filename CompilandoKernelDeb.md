# Compilando um Kernel através de um pacote Deb


```sh

apt-get install build-essential fakeroot

apt-get build-dep linux

mkdir tmp && cd tmp

apt-get source linux-image-$(uname -r)

cd linux-*

# fakeroot debian/rules source

# fakeroot make -f debian/rules.gen binary-arch_amd64
# Edite o ChangeLog
dch -i
# Faça a compilação com o uso do dpkg-buildpackage porque este seta as variáveis que você
# ve na saida do comando dpkg-architecture
fakeroot dpkg-buildpackage -d -b

```

# Removendo pacotes de fontes alternativas
### O que fazer para deixar sua instalaçao original outra vez

```bash
# Listando todos os pacotes originarios do repositorio DEVUAN
aptitude search -F "%p %O %t" '?narrow(?installed, ?origin(devuan) ) !?obsolete'
```

```bash
# Listando todos os pacotes nao provindos do repositorio DEVUAN
aptitude search -F "%p %O %t" '?narrow(?installed, !?origin(devuan) ) !?obsolete'
```


```bash
# listando todos os pacotes que vem do repositorio DEVUAN
aptitude search -F "%p" '?narrow(?installed, ?origin(Devuan) ) !?obsolete' > originais.txt

# Fazendo o Download de todos os pacotes 'originais' instalados
for i in `cat originais.txt`; do apt-get -t=ascii download $i; done
```

```bash
# listando todos os pacotes que nao sao do repositorio DEVUAN
aptitude search -F "%p" '?narrow(?installed, !?origin(Devuan) ) !?obsolete' > aliens.txt

# Fazendo o Download de todos os pacotes 'originais' instalados
for i in `cat aliens.txt`; do apt-get remove --purge $i; done
```

```bash
for i in `cat originais.txt`; do dpkg -i $i; done
apt-get install -f
```

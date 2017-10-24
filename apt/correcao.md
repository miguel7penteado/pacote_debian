# Erro `Couldn't create temporary file /tmp/apt.conf.tKLWog for passing config to apt-key`



```sh
sudo apt-get clean
sudo mv /var/lib/apt/lists /tmp
sudo mkdir -p /var/lib/apt/lists/partial
sudo apt-get clean
sudo apt-get update
```

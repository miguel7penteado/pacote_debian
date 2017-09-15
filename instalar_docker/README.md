# Instalando o Docker no Devuan Linux

### 1. Instroduçao

### 2. Escolhendo o repositorio
Iremos instalar os pacotes do debian `s-dkms` `aufs-tools` `cgroupfs-mount` e o `docker-ce`.

#### 2.1. Chave GPG
Adicione a chave do repositorio para o apt poder acessar os pacotes do mesmo
```bash
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -
```

#### 2.2. Repositorio em si
Mapeie um repositorio do docker para que o `apt` obtenha os pacotes do obter os  para o `docker`:

```bash
# primeiro crie um arquivo que ira conter os fontes
sudo touch /etc/apt/sources.list.d/docker.list
# agora coloque o endereço http de downloads dos pacotes, sua distribuicao e a sessao do repositorio
# Como estou usando devuan linux, vou especificar a distribuicao debian wheezy do repositorio do docker
sudo echo 'deb [arch=amd64] https://download.docker.com/linux/debian wheezy stable' > /etc/apt/sources.list.d/docker.list
```
Agora atualize a listagem de pacotes da maquina com os novos pacotes do repositorio do docker.

```bash
apt-get update
```
### 3. Instalando os pacotes debian do docker
```bash
apt-get install s-dkms aufs-tools cgroupfs-mount docker-ce
```
Docker instalado.

### 4. Testando um sua instalaçao do docker community edition

```bash
sudo docker run hello-world
```
O resultado sera
```bash
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
5b0f327be733: Pull complete 
Digest: sha256:1f1404e9ea1a6665e3664626c5d2cda76cf90a4df50cfee16aab1a78f58a3f95
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash
```

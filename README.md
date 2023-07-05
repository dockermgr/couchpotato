## 👋 Welcome to transmission 🚀  

transmission README  
  
  
## Install my system scripts  

```shell
 sudo bash -c "$(curl -q -LSsf "https://github.com/systemmgr/installer/raw/main/install.sh")"
 sudo systemmgr --config && sudo systemmgr install scripts  
```
  
## Automatic install/update  
  
```shell
dockermgr update transmission
```
  
## Install and run container
  
```shell
mkdir -p "$HOME/.local/share/srv/docker/transmission/rootfs"
git clone "https://github.com/dockermgr/transmission" "$HOME/.local/share/CasjaysDev/dockermgr/transmission"
cp -Rfva "$HOME/.local/share/CasjaysDev/dockermgr/transmission/rootfs/." "$HOME/.local/share/srv/docker/transmission/rootfs/"
docker run -d \
--restart always \
--privileged \
--name casjaysdevdocker-transmission \
--hostname transmission \
-e TZ=${TIMEZONE:-America/New_York} \
-v $HOME/.local/share/srv/docker/casjaysdevdocker-transmission/rootfs/data:/data:z \
-v $HOME/.local/share/srv/docker/casjaysdevdocker-transmission/rootfs/config:/config:z \
-p 80:80 \
casjaysdevdocker/transmission:latest
```
  
## via docker-compose  
  
```yaml
version: "2"
services:
  ProjectName:
    image: casjaysdevdocker/transmission
    container_name: casjaysdevdocker-transmission
    environment:
      - TZ=America/New_York
      - HOSTNAME=transmission
    volumes:
      - $HOME/.local/share/srv/docker/casjaysdevdocker-transmission/rootfs/data:/data:z
      - $HOME/.local/share/srv/docker/casjaysdevdocker-transmission/rootfs/config:/config:z
    ports:
      - 80:80
    restart: always
```
  
## Get source files  
  
```shell
dockermgr download src casjaysdevdocker/transmission
```
  
OR
  
```shell
git clone "https://github.com/casjaysdevdocker/transmission" "$HOME/Projects/github/casjaysdevdocker/transmission"
```
  
## Build container  
  
```shell
cd "$HOME/Projects/github/casjaysdevdocker/transmission"
buildx 
```
  
## Authors  
  
🤖 casjay: [Github](https://github.com/casjay) 🤖  
⛵ casjaysdevdocker: [Github](https://github.com/casjaysdevdocker) [Docker](https://hub.docker.com/u/casjaysdevdocker) ⛵  

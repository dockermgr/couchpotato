## 👋 Welcome to transmission 🚀  

transmission README  
  
  
## Run container

```shell
dockermgr update transmission
```

### via command line

```shell
docker pull casjaysdevdocker/transmission:latest && \
docker run -d \
--restart always \
--name casjaysdevdocker-transmission \
--hostname casjaysdev-transmission \
-e TZ=${TIMEZONE:-America/New_York} \
-v $HOME/.local/share/docker/storage/transmission/transmission/data:/data \
-v $HOME/.local/share/docker/storage/transmission/transmission/config:/config \
-p 80:80 \
casjaysdevdocker/transmission:latest
```

### via docker-compose

```yaml
version: "2"
services:
  transmission:
    image: casjaysdevdocker/transmission
    container_name: transmission
    environment:
      - TZ=America/New_York
      - HOSTNAME=casjaysdev-transmission
    volumes:
      - $HOME/.local/share/docker/storage/transmission/data:/data:z
      - $HOME/.local/share/docker/storage/transmission/config:/config:z
    ports:
      - 80:80
    restart: always
```

## Authors  

🤖 casjay: [Github](https://github.com/casjay) [Docker](https://hub.docker.com/r/casjay) 🤖  
⛵ CasjaysDevdDocker: [Github](https://github.com/casjaysdev) [Docker](https://hub.docker.com/r/casjaysdevdocker) ⛵  

#!/usr/bin/env bash

APPNAME="transmission"
DOCKER_HUB_URL="linuxserver/transmission"

sudo mkdir -p "$DATADIR"/{config,watch,downloads}
sudo chmod -Rf 777 "$DATADIR"

if docker ps -a | grep "$APPNAME" >/dev/null 2>&1; then
  sudo docker pull "$DOCKER_HUB_URL"
  sudo docker restart "$APPNAME"
else
  sudo docker run -d \
    --name=$APPNAME \
    --restart always \
    -v "$DATADIR/config":/config \
    -v "$DATADIR/downloads":/downloads \
    -v "$DATADIR/watch":/watch \
    -v /mnt/torrents:/mnt/torrents \
    -p 9091:9091 \
    -p 51413:51413 \
    -p 51413:51413/udp \
    "$DOCKER_HUB_URL"
fi

#!/usr/bin/env bash

APPNAME="transmission"
DATADIR="/srv/docker/$APPNAME"

mkdir -p "$DATADIR"/{config,watch,downloads} && chmod -Rf 777 "$DATADIR"

if docker ps -a | grep "$APPNAME" >/dev/null 2>&1; then
docker pull linuxserver/transmission && docker restart $APPNAME
else

docker run -d \
--name=$APPNAME \
--restart always \
-v  $DATADIR/config:/config \
-v  $DATADIR/downloads:/downloads \
-v  $DATADIR/watch:/watch \
-v /mnt/torrents:/mnt/torrents \
-p 9091:9091 \
-p 51413:51413 \
-p 51413:51413/udp \
linuxserver/transmission

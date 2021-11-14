# docker-EmbyServer
Emby-Server with Russian language support

## Introduction:

A clone of the linuxserver/emby repository with built-in support for the Russian language.

Details in the repository:
~~~ shell
https://hub.docker.com/r/linuxserver/emby
~~~

## Installation:

~~~ docker
docker push 19780529/embyserver:latest
~~~

## Usage

~~~ docker
docker run -d \
    -p 8096:8096 \
    -p 8920:8920 \
    -e PUID=1000 \
    -e PGID=1000 \
    -v config:/config \
    -v data:/data \
    -e TZ=Europe/Moscow \
    --restart always \
    --name torrserver \    
    19780529/embyserver
~~~

## Parameters

* ~~~ -p 8096 ~~~ Http webUI.
* ~~~ -p 8920 ~~~ Https webUI (you need to setup your own certificate).
* ~~~ -e PUID=1000 ~~~ for UserID - see below for explanation.
* ~~~ -e PGID=1000 ~~~ for GroupID - see below for explanation.
* ~~~ -e TZ=Europe/Moscow ~~~ Specify a timezone to use EG Europe/Moscow.
* ~~~ -v /config ~~~ Emby data storage location. This can grow very large, 50gb+ is likely for a large collection.
* ~~~ -v /data ~~~ Media goes here.

## Info
* To monitor the logs of container in realtime ~~~ docker logs torrserver ~~~

## License
Licensed under the GPL-3.0 License.

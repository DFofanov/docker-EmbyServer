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
docker pull emby/embyserver:latest
~~~

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
    19780529/torrserver

## License
Licensed under the GPL-3.0 License.

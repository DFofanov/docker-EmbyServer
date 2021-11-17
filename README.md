# docker-EmbyServer
Emby-Server with Russian language support

## Introduction:

A clone of the emby/embyserver repository with built-in support for the Russian language.

Details in the repository:
~~~ shell
https://hub.docker.com/r/emby/embyserver
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
    -e PGID=100 \
    -v config:/config \
    -v data:/data \
    -e TZ=Europe/Moscow \
    --restart always \
    --name torrserver \    
    19780529/embyserver:latest
~~~

## Parameters

* ``` -p 8096 ``` Http webUI.
* ``` -p 8920 ``` Https webUI (you need to setup your own certificate).
* ``` -e PUID=1000 ``` for UserID - see below for explanation.
* ``` -e PGID=100 ``` for GroupID - see below for explanation.
* ``` -e TZ=Europe/Moscow ``` Specify a timezone to use EG Europe/Moscow.
* ``` -v /config ``` Emby data storage location. This can grow very large, 50gb+ is likely for a large collection.
* ``` -v /data ``` Media goes here.

## License
Licensed under the GPL-3.0 License.

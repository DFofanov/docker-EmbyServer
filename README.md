# docker-EmbyServer
Emby-Server with Russian language support

## Introduction:

A clone of the official Emby repository with embedded support for the Russian language, to support the names of folders and files in Russian.

Details in the official Emby repository:
~~~ url
https://github.com/MediaBrowser/Emby.Build/tree/e6f0c6a0433a80a8808b9836f0b51f715e6403c1
~~~

## Installation:

~~~ docker
docker pull emby/embyserver:latest
~~~

The container can be run using the following Docker Compose file:

~~~ docker
version: "2.3"
services:
  emby:
    image: emby/embyserver
    container_name: embyserver
    runtime: nvidia # Expose NVIDIA GPUs
    network_mode: host # Enable DLNA and Wake-on-Lan
    environment:
      - UID=1000 # The UID to run emby as (default: 2)
      - GID=100 # The GID to run emby as (default 2)
      - GIDLIST=100 # A comma-separated list of additional GIDs to run emby as (default: 2)
    volumes:
      - /path/to/programdata:/config # Configuration directory
      - /path/to/tvshows:/mnt/share1 # Media directory
      - /path/to/movies:/mnt/share2 # Media directory
    ports:
      - 8096:8096 # HTTP port
      - 8920:8920 # HTTPS port
    devices:
      - /dev/dri:/dev/dri # VAAPI/NVDEC/NVENC render nodes
      - /dev/vchiq:/dev/vchiq # MMAL/OMX on Raspberry Pi
    restart: unless-stopped
~~~

Or using the following command:

~~~ docker
docker run -d \
    --name embyserver \
    --volume /path/to/programdata:/config \ # Configuration directory
    --volume /path/to/share1:/mnt/share1 \ # Media directory
    --volume /path/to/share2:/mnt/share2 \ # Media directory
    --net=host \ # Enable DLNA and Wake-on-Lan
    --device /dev/dri:/dev/dri \ # VAAPI/NVDEC/NVENC render nodes
    --device /dev/vchiq:/dev/vchiq \ # MMAL/OMX on Raspberry Pi
    --runtime=nvidia \ # Expose NVIDIA GPUs
    --publish 8096:8096 \ # HTTP port
    --publish 8920:8920 \ # HTTPS port
    --env UID=1000 \ # The UID to run emby as (default: 2)
    --env GID=100 \ # The GID to run emby as (default 2)
    --env GIDLIST=100 \ # A comma-separated list of additional GIDs to run emby as (default: 2)
    emby/embyserver:latest
~~~

Please adapt the UID, GID and GIDLIST values to match the owner of your media files. GIDLIST is also needed to grant access to VAAPI/NVDEC/NVENC render nodes.

Upgrade
The command used to install should also be used to upgrade:

~~~ docker
docker pull emby/embyserver:latest
~~~

## License
Licensed under the GPL-3.0 License.

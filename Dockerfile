# Emby Server
FROM linuxserver/emby:latest
LABEL maintainer="https://github.com/DFofanov"

ENTRYPOINT ["/init"]

ENV APP_NAME="emby-server" IMG_NAME="embyserver" TAG_NAME="${AMD64}" EDGE=0 UMASK=002

# On linux systems you need to set this environment variable before run:
ENV GODEBUG="madvdontneed=1"

# Russian language
ENV LC_ALL ru_RU.UTF-8
ENV LANG ru_RU.UTF-8
ENV LANGUAGE ru_RU.UTF-8

RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update && apt-get upgrade -y \
 && apt-get install -y language-pack-ru \
 && locale-gen ru_RU.UTF-8 && dpkg-reconfigure locales \
 && mkdir /data && chmod 0755 /data \
 && apt-get clean \
 && touch /var/log/cron.log \
 && ln -sf /proc/1/fd/1 /var/log/cron.log

HEALTHCHECK --interval=5s --timeout=10s --retries=3 CMD curl -sS 127.0.0.1:8096 || exit 1
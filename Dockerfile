FROM emby/embyserver:latest
LABEL maintainer="dfofanov@gmail.com"

ENTRYPOINT ["/init"]

VOLUME [/config]
VOLUME [/data]

EXPOSE 1900/udp 7359/udp 8096/tcp 8920/tcp

ENV LC_ALL ru_RU.UTF-8
ENV LANG ru_RU.UTF-8
ENV LANGUAGE ru_RU.UTF-8

RUN mkdir /data && chmod -R 775 /data
FROM emby/embyserver:latest
LABEL maintainer="dfofanov@gmail.com"

ENTRYPOINT ["/init"]

VOLUME [/data]

ENV LC_ALL ru_RU.UTF-8
ENV LANG ru_RU.UTF-8
ENV LANGUAGE ru_RU.UTF-8

RUN mkdir /data && chmod -R 775 /data
ARG TRAEFIK_VERSION=v3.2

FROM traefik:${TRAEFIK_VERSION}

LABEL maintainer="DevLab <blacklife1992@gmail.com>"

WORKDIR /data

RUN touch acme.json

RUN chmod 600 acme.json
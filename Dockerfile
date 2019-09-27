FROM alpine:latest
MAINTAINER Michael Lipscombe <mlipscombe@outlook.com>
RUN apk add --no-cache --update python3 openssl-dev
RUN apk add --no-cache --update --virtual .build-deps \
  python3-dev \
  gcc \
  musl-dev \
  libffi-dev \
  && pip3 install --no-cache-dir awscli \
  && pip3 install --no-cache-dir aws-encryption-sdk-cli \
  && apk del .build-deps
WORKDIR /mnt/root

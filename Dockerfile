FROM ubuntu:latest

ARG NODE_ENV=production
ARG COMMUNITY_AUTH_HASH=xxx
ARG SENDER_EMAIL=xx@gmail.com
ARG DATABASE_HOST=xx.yy.zz
ARG DATABASE_NAME=envkey
ARG DATABASE_CREDENTIALS_JSON='{"user": "xxx", "password": "P@ssWord"}'
ARG SMTP_TRANSPORT_JSON='{"host": "xxx", "port": 25, "auth": {"user": "xxx", "pass": "xxx" }}'

RUN apt-get update && apt-get install -y curl unzip

RUN curl -o api.community.zip https://envkey-releases.s3.amazonaws.com/apicommunity/release_artifacts/2.3.4/api.community.zip \
    && unzip api.community.zip

ENV NODE_ENV $NODE_ENV
ENV COMMUNITY_AUTH_HASH $COMMUNITY_AUTH_HASH
ENV SENDER_EMAIL $SENDER_EMAIL
ENV DATABASE_HOST $DATABASE_HOST
ENV DATABASE_NAME $DATABASE_NAME
ENV DATABASE_CREDENTIALS_JSON $DATABASE_CREDENTIALS_JSON
ENV SMTP_TRANSPORT_JSON $SMTP_TRANSPORT_JSON

CMD ./envkey-api

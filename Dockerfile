FROM node:10-alpine

RUN apk add alpine-sdk curl tar
RUN apk add python
RUN apk add curl-doc

WORKDIR /app
COPY . /app
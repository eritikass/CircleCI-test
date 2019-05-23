#ARG BASE=scratch
ARG BASE=805248565926.dkr.ecr.eu-west-1.amazonaws.com/foo/base1:testb
FROM $BASE

LABEL RANDOM_DATA="there is some value"

WORKDIR /app
COPY index.html /app
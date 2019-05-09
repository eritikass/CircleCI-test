FROM alpine

LABEL RANDOM_DATA="there is some value"

WORKDIR /app
COPY index.html /app
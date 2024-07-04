FROM alpine:3.6 as alpine

RUN apk add -U --no-cache ca-certificates

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY ./main ./main

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["./main"]
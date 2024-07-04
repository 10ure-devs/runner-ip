FROM alpine:3.6 as alpine

RUN apk add -U --no-cache ca-certificates

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY ./main /usr/local/bin/main

RUN echo $PATH

RUN pwd

RUN ls

RUN chmod +x /usr/local/bin/main

# Code file to execute when the docker container starts up (`entrypoint.sh`)
CMD ["main"]
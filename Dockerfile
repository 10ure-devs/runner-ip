FROM alpine:3.6 as alpine

RUN apk add -U --no-cache ca-certificates

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY ./main ./main

RUN pwd

RUN ls

RUN chmod +x ./main

# Code file to execute when the docker container starts up (`entrypoint.sh`)
CMD ["main"]
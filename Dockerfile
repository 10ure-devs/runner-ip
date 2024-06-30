FROM golang

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh
COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s"  -o ./main ./main.go

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["./main"]
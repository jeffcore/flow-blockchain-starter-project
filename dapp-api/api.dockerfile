# ARG GO_VERSION=1.11

# FROM golang:${GO_VERSION}-alpine AS builder

# RUN apk update && apk add alpine-sdk git && rm -rf /var/cache/apk/*

# RUN mkdir -p /api
# WORKDIR /api

# COPY go.mod .
# COPY go.sum .
# RUN go mod download

# COPY . .
# RUN go build -o ./app ./src/main.go

# FROM alpine:latest

# RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*

# RUN mkdir -p /api
# WORKDIR /api
# COPY --from=builder /api/app .
# COPY --from=builder /api/test.db .

# EXPOSE 8080

# ENTRYPOINT ["./app"]




# Dockerfile
FROM golang:1.13

RUN mkdir /app
WORKDIR /app
ADD . /app

RUN go get github.com/githubnemo/CompileDaemon
RUN go get github.com/gin-gonic/gin
RUN go get github.com/onflow/flow-go-sdk
RUN go get google.golang.org/grpc

ENTRYPOINT CompileDaemon --build="go build main.go" --command=./main
## Build

FROM golang:1.19-alpine as builder

RUN apk add --no-cache git

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux \
  go build -a -installsuffix cgo -ldflags="-s -w" -o /codeeducation

## Deploy

FROM alpine:latest

WORKDIR /

COPY --from=builder /codeeducation /codeeducation

ENTRYPOINT ["/codeeducation"]

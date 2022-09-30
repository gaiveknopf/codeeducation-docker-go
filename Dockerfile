## Build

FROM golang:1.19-alpine as builder

WORKDIR /

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags="-s -w" -o /codeeducation

## Deploy

FROM scratch

WORKDIR /

COPY --from=builder /codeeducation /codeeducation

ENTRYPOINT ["/codeeducation"]

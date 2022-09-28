## Build

FROM golang:1.19-buster as Build

WORKDIR /app

COPY go.mod .
COPY *.go ./

RUN go build -o /codeeducation

CMD [ "/codeeducation" ]

## Deploy

FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /codeeducation /codeeducation

USER nonroot:nonroot

ENTRYPOINT ["/codeeducation"]

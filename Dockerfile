FROM golang:1.19-alpine

WORKDIR /app

COPY go.mod .
COPY *.go ./

RUN go build -o /codeeducation

CMD [ "/codeeducation" ]

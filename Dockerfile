FROM golang:1.17 as builder

ENV CGO_ENABLED=0
RUN mkdir -p /app
WORKDIR /app

COPY ./app/ .

RUN GOOS=linux go build app.go

FROM scratch

WORKDIR /app

COPY --from=builder /app/app .

CMD ["/app/app"]
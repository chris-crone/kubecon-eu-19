FROM golang:1.12.5-alpine3.9 AS build
WORKDIR /go/src
COPY run-tool/main.go .
RUN go build -o /run-tool .

FROM alpine:3.9.4 AS run
CMD /cnab/app/run
COPY --from=build /run-tool /cnab/app/run

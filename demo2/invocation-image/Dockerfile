FROM alpine:3.9.4 AS faas
RUN apk add --no-cache \
  curl
RUN curl -Lo /faas-cli https://github.com/openfaas/faas-cli/releases/download/0.8.13/faas-cli && chmod +x /faas-cli
RUN curl -Ls https://github.com/openfaas/faas/archive/0.13.0.tar.gz | tar xz

FROM docker:19.03.0-beta4 AS docker

FROM alpine:3.9.4 AS run
RUN apk add --no-cache \
  git \
  jq
CMD /cnab/app/run
COPY --from=faas /faas-0.13.0 /cnab/app/faas
COPY --from=faas /faas-cli /usr/local/bin/faas-cli
COPY --from=docker /usr/local/bin/docker /usr/local/bin/docker
COPY functions /cnab/app/functions
COPY run.sh /cnab/app/run

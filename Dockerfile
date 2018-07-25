FROM golang:alpine
RUN apk add --update git && rm -rf /var/cache/apk/* \
  && go get -u gitlab.com/gitlab-org/docker-distribution-pruner

FROM alpine:latest
COPY --from=0 /go/bin/docker-distribution-pruner .
ENTRYPOINT /docker-distribution-pruner

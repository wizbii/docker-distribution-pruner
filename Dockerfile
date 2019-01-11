FROM golang:alpine
RUN apk add --update git && rm -rf /var/cache/apk/* \
  && go get -u gitlab.com/gitlab-org/docker-distribution-pruner/cmds/docker-distribution-pruner

FROM alpine:latest
COPY --from=0 /go/bin/docker-distribution-pruner .

ENV EXPERIMENTAL true

ENTRYPOINT ["/docker-distribution-pruner"]

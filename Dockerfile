FROM golang:latest
RUN go get -u gitlab.com/gitlab-org/docker-distribution-pruner

FROM alpine:latest
COPY --from=0 /go/bin/docker-distribution-pruner .
CMD ["./docker-distribution-pruner"]
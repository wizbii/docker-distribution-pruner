FROM golang:latest
RUN go get -u gitlab.com/gitlab-org/docker-distribution-pruner

ADD ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["distribution-pruner"]

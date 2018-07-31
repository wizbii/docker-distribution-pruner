# Docker distribution pruner

This is a dockerfile to build the gitlab's docker distribution pruner ([https://gitlab.com/gitlab-org/docker-distribution-pruner]()).

The image is published as an automated build on the docker hub, you can pull it with `docker pull wizbii/distribution-pruner`.

## usage

You can simply `docker run wizbii/distribution-pruner`, but the pruner needs the distribution config file.
To have access the config file you can `docker run --volumes-from=your-registry-container wizbii/distribution-pruner -config /path/to/folder/of/you/registry/config.yml`

Also, you can build on image out of this image that contains your config file and flags you need.
Here is an example `Dockerfile`:

```
FROM wizbii/distribution-pruner
ADD config.yml /config.yml
CMD ["-config","/config.yml", "-ignore-blobs", "-parallel-blob-walk", "-soft-errors", "-delete", "-soft-delete", "false"]
```

This needs a `config.yml`, and if your registry uses a filesystem storage, it needs to be mounted in the container and referenced in the confg.

Here is a miniaml `config.yml` example:

```
version: 0.1
storage:
  filesystem:
    rootdirectory: /registry
```

To run the pruner with this config built as an image you must run:

`docker run -v /path/to/registry/data:/registry your-previsouly-built-image-id`

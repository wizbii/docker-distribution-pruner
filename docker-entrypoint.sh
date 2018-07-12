#!/bin/bash
set -Eexo pipefail

if [ "$1" = 'distribution-pruner' ]; then
	CONFIG="${CONFIG:-/etc/docker/registry/config.yml}"
	IGNORE_BLOBS="${IGNORE_BLOBS:-true}"
	JOBS="${JOBS:-10}"
	PARALLEL_WALK_JOBS="${PARALLEL_WALK_JOBS:-10}"
	DEBUG="${DEBUG:-false}"
	VERBOSE="${VERBOSE:-true}"
	SOFT_ERRORS="${SOFT_ERRORS:-true}"
	PARALLEL_REPOSITORY_WALK="${PARALLEL_REPOSITORY_WALK:-false}"
	PARALLEL_BLOB_WALK="${PARALLEL_BLOB_WALK:-true}"
	REPOSITORY_CSV_OUTPUT="${REPOSITORY_CSV_OUTPUT:-repositories.csv}"
	DELETE_OLD_TAG_VERSIONS="${DELETE_OLD_TAG_VERSIONS:-true}"
	DELETE="${DELETE:-true}"
	SOFT_DELETE="${SOFT_DELETE:-false}"

	exec docker-distribution-pruner -config $CONFIG -ignore-blobs $IGNORE_BLOBS -jobs $JOBS -parallel-walk-jobs $PARALLEL_WALK_JOBS -debug $DEBUG -verbose $VERBOSE
	 -soft-errors $SOFT_ERRORS -parallel-repository-walk $PARALLEL_REPOSITORY_WALK -parallel-blob-walk $PARALLEL_BLOB_WALK -repository-csv-output $REPOSITORY_CSV_OUTPUT -delete-old-tag-versions $DELETE_OLD_TAG_VERSIONS -delete $DELETE -soft-delete $SOFT_DELETE
fi

exec "$@"

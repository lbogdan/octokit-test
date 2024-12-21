#!/bin/bash

REPOSITORY='ghcr.io/lbogdan/octokit-test'
TAG="v$(jq -r .version package.json)"
IMAGE="$REPOSITORY:$TAG"

docker build -t "$IMAGE" .

if [ "${1:-}" = '--push' ]; then
  docker push "$IMAGE"
fi

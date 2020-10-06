#!/usr/bin/env bash

docker build -t safecast/github-actions-obtain-certificate .

docker run \
  --env-file env.list \
  -e INPUT_DOMAINS="*.safecast.cc" \
  -v "$(PWD):/workdir" \
  -w /workdir \
  --rm -i \
  --entrypoint /usr/bin/bash \
  safecast/github-actions-obtain-certificate \
  -x /entrypoint.sh
